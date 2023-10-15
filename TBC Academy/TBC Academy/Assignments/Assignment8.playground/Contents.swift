//1. შევქმნათ Class Book.
//
//Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//
//Designated Init.
//
//Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
//
//Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.

class Book {
   
    let bookID: Int
    let title: String
    let author: String
    var isBorrowed: Bool
    
    init(bookID: Int, title: String, author: String) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = false
    }
    
    func makeBorrowed() {
        isBorrowed = true
    }
    
    func makeReturned() {
        isBorrowed = false
    }
}

//2. შევქმნათ Class Owner
////
////Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
////
////Designated Init.
////
////Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
////
////Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.

class Owner {
    let ownerID: Int
    let name: String
    var borrowedBooks: [Book]

    init(ownerID: Int, name: String) {
        self.ownerID = ownerID
        self.name = name
        self.borrowedBooks = []
    }
    
    func borrowBook(_ book: Book) {
        borrowedBooks.append(book)
    }
    
    func returnBook(_ book: Book) {
        borrowedBooks.removeAll(where: { $0.bookID == book.bookID })
    }
}


//3. შევქმნათ Class Library

//Properties: Books Array, Owners Array.
//
//Designated Init.
//
//Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
//
//Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
//
//Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
//
//Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
//
//Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
//
//Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
//
//Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.
    
class Library {
    var books: [Book]
    var owners: [Owner]
    
    init() {
        self.books = []
        self.owners = []
    }
    
    func addBook(_ book: Book) {
        books.append(book)
    }
    
    func addOwner(_ owner: Owner) {
        owners.append(owner)
    }
    
    func getAvailableBooks() -> [Book] {
        books.filter({ !$0.isBorrowed})
    }
    
    func getBorrowedBooks() -> [Book] {
        books.filter({ $0.isBorrowed })
    }
    
    func findOwnerByID(_ id: Int) -> Owner? {
        owners.first(where: { $0.ownerID == id })
    }
    
    func getBorrowedBooks(by owner: Owner) -> [Book] {
        owner.borrowedBooks
    }
    
    func tryBorrowBook(_ book: Book, by owner: Owner) {
        if book.isBorrowed { return }
        
        owner.borrowBook(book)
        book.makeBorrowed()
    }
    
    func returnBook(_ book: Book, by owner: Owner) {
        owner.returnBook(book)
        book.makeReturned()
    }
}

//4. გავაკეთოთ ბიბლიოთეკის სიმულაცია.
//
//შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
//
//დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
//
//წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
//
//დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.

let book1 = Book(bookID: 1, title: "Title 1", author: "Author 1")
let book2 = Book(bookID: 2, title: "Title 2", author: "Author 2")
let book3 = Book(bookID: 3, title: "Title 3", author: "Author 3")

let owner1 = Owner(ownerID: 1, name: "Owner 1")
let owner2 = Owner(ownerID: 2, name: "Owner 2")
let owner3 = Owner(ownerID: 3, name: "Owner 3")

let library = Library()

library.addBook(book1)
library.addBook(book2)
library.addBook(book3)

library.addOwner(owner1)
library.addOwner(owner2)
library.addOwner(owner3)

library.tryBorrowBook(book1, by: owner1)
library.tryBorrowBook(book2, by: owner2)
library.tryBorrowBook(book3, by: owner3)

library.returnBook(book2, by: owner2)

print("Books borrowed from library: \(library.getBorrowedBooks())")

print("Book available in library: \(library.getAvailableBooks())")

print("Taken books by \(owner1) are \(library.getBorrowedBooks(by: owner1))")
print("Taken books by \(owner2) are \(library.getBorrowedBooks(by: owner2))")
print("Taken books by \(owner3) are \(library.getBorrowedBooks(by: owner3))")



//1. შევქმნათ Class Product,
//შევქმნათ შემდეგი properties productID (უნიკალური იდენტიფიკატორი Int), String name, Double price.
//შევქმნათ Designated Init.

class Product {
    let productID: Int
    let name: String
    let price: Double
    
    init(productID: Int, name: String, price: Double) {
        self.productID = productID
        self.name = name
        self.price = price
    }
}


//2. შევქმნათ Class Cart
//
//Properties: cartID(უნიკალური იდენტიფიკატორი Int), Product-ების Array სახელად items.
//
//შევქმნათ Designated Init.
//
//Method იმისათვის რომ ჩვენს კალათაში დავამატოთ პროდუქტი.
//
//Method იმისათვის რომ ჩვენი კალათიდან წავშალოთ პროდუქტი მისი აიდით.
//
//Method რომელიც დაგვითვლის ფასს ყველა იმ არსებული პროდუქტის რომელიც ჩვენს კალათაშია.

class Cart {
    let cartID: Int
    var items: [Product]
    
    init(cartID: Int) {
        self.cartID = cartID
        self.items = []
    }
    
    func addProduct(_ product: Product) {
        items.append(product)
    }
    
    func removeProductByID(_ id: Int) {
        items.removeAll(where: { $0.productID == id })
    }
    
    func getTotalPrice() -> Double {
        var totalPrice: Double = 0
        for item in items {
            totalPrice += item.price
        }
        return totalPrice
    }
    
    func clear() {
        items = []
    }
}

//3. შევქმნათ Class User
//
//Properties: userID(უნიკალური იდენტიფიკატორი Int), String username, Cart cart.
//
//Designated Init.
//
//Method რომელიც კალათაში ამატებს პროდუქტს.
//
//Method რომელიც კალათიდან უშლის პროდუქტს.
//
//Method რომელიც checkout (გადახდის)  იმიტაციას გააკეთებს დაგვითვლის თანხას და გაასუფთავებს ჩვენს shopping cart-ს.

class User {
    let userID: Int
    let username: String
    let cart: Cart
    
    init(userID: Int, username: String) {
        self.userID = userID
        self.username = username
        self.cart = Cart(cartID: userID)
    }
    
    func addProductToCart(_ product: Product) {
        cart.addProduct(product)
    }
    
    func removeProductFromCart(_ product: Product) {
        cart.removeProductByID(product.productID)
    }
    
    func checkout() {
        let totalPriceToPay = cart.getTotalPrice()
        print("Payed: \(totalPriceToPay)")
        cart.clear()
    }
}


//4. გავაკეთოთ იმიტაცია და ვამუშაოთ ჩვენი ობიექტები ერთად.
//
//შევქმნათ რამოდენიმე პროდუქტი.
//
//შევქმნათ 2 user-ი, თავისი კალათებით,
//
//დავუმატოთ ამ იუზერებს კალათებში სხვადასხვა პროდუქტები,
//
//დავბეჭდოთ price ყველა item-ის ამ იუზერების კალათიდან.
//
//და ბოლოს გავაკეთოთ სიმულაცია ჩექაუთის, დავაბეჭდინოთ იუზერების გადასხდელი თანხა და გავუსუფთაოთ კალათები.

let product1 = Product(productID: 1, name: "Product 1", price: 1)
let product2 = Product(productID: 2, name: "Product 2", price: 2)
let product3 = Product(productID: 3, name: "Product 3", price: 3)

let user1 = User(userID: 1, username: "user-1")
let user2 = User(userID: 2, username: "user-2")

user1.addProductToCart(product1)
user1.addProductToCart(product3)

user2.addProductToCart(product2)
user2.addProductToCart(product3)

print("Total price in cart of user 1 = \(user1.cart.getTotalPrice())")
print("Total price in cart of user 2 = \(user2.cart.getTotalPrice())")

user1.checkout()
user2.checkout()
