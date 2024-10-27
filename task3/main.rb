# Base class for common properties and methods
class LibraryItem
    attr_accessor :title, :author, :publication_year

    def initialize(title, author, publication_year)
        @title = title
        @author = author
        @publication_year = publication_year
    end

    def display_info
        puts "Title: #{@title}, Author: #{@title}, Year: #{@publication_year}"
    end
end

class Book < LibraryItem
    attr_accessor :genre

    def initialize(title, author, publication_year, genre)
        super(title, author, publication_year)
        @genre = genre
    end

    def display_info
        super
        puts "Genre: #{@genre}"
    end
end

# Derived class for DVD
class DVD < LibraryItem
    attr_accessor :director

    def initialize(title, author, publication_year, director)
        super(title, author, publication_year)
        @director = director
    end

    def display_info
        super
        puts "Director: #{@director}"
    end
end

# Derived class for CD
class CD < LibraryItem
    attr_accessor :artist

    def initialize(title, author, publication_year, artist)
        super(title, author, publication_year)
        @artist = artist
    end

    def display_info
        super
        puts "Artist: #{@artist}"
    end
end

# Library class to manage items
class Library
    def initialize
        @items = []
    end

    # Method to add an item to the library
    def add_item(item)
        @items.push(item)
    end

    # Method to remove an item from the library
    def remove_item(item)
        @items.delete(item)
    end

    # Display information for all items, demonstrating polymorphism
    def display_all_items
        @items.each(&:display_info)
    end
end

# Crеatе instancеs of diffеrеnt library itеms
book = Book.new("Concepts of Programming Languages", "Robert Sebesta", 2015, "Programming")
dvd = DVD.new("Inception", "Christopher Nolan", 2010, "Science Fiction")
cd = CD.new("A Day at the Races", "Queen", 1976, "Rock")

# Display itеms individually
book.display_info
dvd.display_info
cd.display_info

# # Crеatе a library and add itеms to it
library = Library.new
library.add_item(book)
library.add_item(dvd)
library.add_item(cd)

# # Display information about all itеms in thе library
library.display_all_items