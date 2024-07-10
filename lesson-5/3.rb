module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp.upcase
      break if verb == 'Q'

      unless %w[GET POST PUT DELETE].include?(verb)
        puts "Invalid verb. Please choose one of GET, POST, PUT, DELETE, or q to exit."
        next
      end

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp.downcase
        break if action == 'q'

        unless %w[index show].include?(action)
          puts "Invalid action. Please choose either 'index' or 'show', or q to exit."
          next
        end
      end

      if action.nil?
        if routes[verb].nil?
          puts "No route matches the verb #{verb}. Try again."
          next
        else
          routes[verb].call
        end
      else
        if routes[verb][action].nil?
          puts "No route matches for #{verb} #{action}. Try again."
          next
        else
          routes[verb][action].call
        end
      end
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    ind = 0
    while ind < @posts.size
      puts "#{ind}. #{@posts[ind]}\n"
      ind += 1
    end
    puts "\n"
  end

  def show
    puts 'Введите индекс поста'
    ind = gets.to_i
    puts "#{ind}. #{@posts[ind]}\n\n"
  end

  def create
    puts 'Введите текст для нового поста'
    txt = gets.to_s
    @posts.push(txt)
    puts "#{@posts.size-1}. #{@posts[-1]}\n\n"
  end

  def update
    puts 'Введите индекс и текст поста для замены'
    ind = gets.to_i
    txt = gets.to_s
    @posts[ind] = txt
    index
  end

  def destroy
    puts 'Введите индекс для удаления поста'
    ind = gets.to_i
    @posts.delete_at(ind)
    index
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact with (1 - Posts, 2 - Comments, q - Exit): '
      choice = gets.chomp

      if choice == '1'
        PostsController.connection(@routes['posts'])
      elsif choice == '2'
        puts 'Comments functionality not implemented yet.'
      elsif choice == 'q'
        break
      else
        puts 'Invalid choice. Please select 1, 2, or q to exit.'
      end
    end

    puts 'Goodbye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new
router.init
