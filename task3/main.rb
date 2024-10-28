# region <---| Class Implementation Parts |--->

class LibraryItem                                              # Base Class for Library items (It goes to no category)

    attr_accessor :title, :author, :publication_year           # `Getter` & `Setter` blocks for instance variables

    def initialize(title, author, publication_year)            # Initialize instance variables
        @title = title
        @author = author
        @publication_year = publication_year
    end

    def display_info                                           # Display info of instance variables
        puts "Title: #{@title} \nAuthor: #{@author} \nYear: #{@publication_year}"
    end
end

class Book < LibraryItem                                       # Derived class Book that inherits from `LibraryItem`

    attr_accessor :genre                                       # `Getter` & `Setter` blocks for instance variables

    def initialize(title, author, publication_year, genre)     # Initialize instance variables
        super(title, author, publication_year)                 # Refer to base class `initialize` method to initialize instance variables
        @genre = genre                                         # Initialieze custom instance variable
    end

    def display_info                                           # Display info of instance variables
        puts "---------| Book Items |---------"                # Since this refers to a category, The category is displayed at top (This is for decoration purpose)
        super                                                  # This line will go to base class and execute `display_info`
        puts "Genre: #{@genre}"                                # Print custom instance variable

        puts "---------|    End     |-----------\n\n"            # Complete by printing multiple dashes (This is for decoration purpose)
    end
end

class DVD < LibraryItem                                        # Derived class DVD that inherits from `LibraryItem`
    
    attr_accessor :director                                    # `Getter` & `Setter` blocks for instance variables

    def initialize(title, author, publication_year, director)  # Initialize instance variables
        super(title, author, publication_year)                 # Refer to base class `initialize` method to initialize instance variables
        @director = director                                   # Initialieze custom instance variable
    end

    def display_info                                           # Display info of instance variables
        puts "----------| DVD Items |----------"               # Since this refers to a category, The category is displayed at top (This is for decoration purpose)
        super                                                  # This line will go to base class and execute `display_info`
        puts "Director: #{@director}"

        puts "----------|    End    |------------\n\n"           # Complete by printing multiple dashes (This is for decoration purpose)
    end
end

class CD < LibraryItem                                         # Derived class CD that inherits from `LibraryItem`

    attr_accessor :artist                                      # `Getter` & `Setter` blocks for instance variables

    def initialize(title, author, publication_year, artist)    # Initialize instance variables
        super(title, author, publication_year)                 # Refer to base class `initialize` method to initialize instance variables
        @artist = artist                                       # Initialieze custom instance variable
    end

    def display_info                                           # Display info of instance variables
        puts "----------| CD Items |-----------"               # Since this refers to a category, The category is displayed at top (This is for decoration purpose)
        super                                                  # This line will go to base class and execute `display_info`
        puts "Artist: #{@artist}"

        puts "----------|   End    |-------------\n\n"           # Complete by printing multiple dashes (This is for decoration purpose)
    end
    
end

class Library                                                  # Store and manage collection of different library items
    
    def initialize                                             # Initialize instance variable `items`. In this caes, it is private
        @items = []                                            # Assign it to `list` 
    end

    def add_item(item)                                         # To add an item to list
        @items.push(item)                                      # Push item to list
    end

    def remove_item(item)                                      # To remove an item from list
        @items.delete(item)
    end

    def display_all_items                                      # Display all items in `@items` list
        for item in @items                                     # Loop to iterate over `@items`
            item.display_info                                  # Calls `display_info` function for each class
        end
    end
end

# endregion

# region <---| Code Implementation Part | --->

# Create instance of `Book` class
book = Book.new(
    "Concepts of Programming Languages", 
    "Robert Sebesta", 
    2015, 
    "Programming"
)   

# Create instance of `DVD` class
dvd = DVD.new(
    "Inception", 
    "Christopher Nolan", 
    2010, 
    "Science Fiction"
)

# Create instance of `CD` class
cd = CD.new(
    "A Day at the Races", 
    "Queen", 
    1976, 
    "Rock"
)   

book.display_info             # Display `book` info                
dvd.display_info              # Display `dvd`  info
cd.display_info               # Display `cd`   info

library = Library.new         # Create instance of `Library`
library.add_item(book)        # Add `book` to library
library.add_item(dvd)         # Add `dvd`  to library
library.add_item(cd)          # Add `cd`   to library

library.display_all_items     # Display all items in `library`

# endregion