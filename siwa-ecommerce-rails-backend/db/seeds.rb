# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

   
        
            seller_one = Seller.create(store_name: "Meydan",
            first_name: "Mohsen",
            last_name: "ElNeny",
            email: "mohsen@meydan.com",
            password:"aa")

            seller_one.items.create(
                name:"Urban hightops",
                description:"Wet weather, all-day urban adventure.",
                image:"https://source.unsplash.com/dwKiHoqqxk8/250x250",
                price:59
            )
            # image id: dwKiHoqqxk8
           

            seller_one.items.create(
                name:"Sunglasses",
                description:"The trendiest designs for your face.",
                image:"https://source.unsplash.com/SYx3UCHZJlo/250x250",
                price: 125
            )
            # image id: SYx3UCHZJlo

            seller_one.items.create(
                name:"Basic tees",
                description:"Up your basic loadout with this set of 5 immaculate tees.",
                image:"https://source.unsplash.com/xPJYL0l5Ii8/250x250",
                price: 65
            )
            # image id: xPJYL0l5Ii8
        
        
            seller_two = Seller.create(store_name: "Garibaldi",
                first_name: "Lucas",
                last_name: "Moura",
                email: "lucas@garibaldi.com",
                password:"aa"
            )   

            seller_two.items.create(
                name:"Beanie hat",
                description:"Merino wool hat lined with soft fleece. Good till -30 F",
                image:"https://source.unsplash.com/Sf8MWkoLreQ/250x250",
                price: 74
            )
            # image id: Sf8MWkoLreQ

            seller_two.items.create(
                name:"Sweatpants",
                description:"Comfortable fit",
                image:"https://source.unsplash.com/eyFcZLLYvfA/250x250",
                price: 37
            )
            # image id: eyFcZLLYvfA
        
        
            seller_three = Seller.create(store_name: "Carnaval",
            first_name: "Gabriel",
            last_name: "Megalhaes",
            email: "gabriel@carnaval.com",
            password:"aa"
        )

            seller_three.items.create(
                name:"Notebook",
                description:"Plain unruled notebook.",
                image:"https://source.unsplash.com/TPoARluSmYs/250x250",
                price:15
            )
            # image id: TPoARluSmYs

            user_1 = User.create(
                first_name: "Amina",
                last_name: "Taha",
                email:"aa@aa.aa",
                password: "aa",
                password_confirmation: "aa"
            )

           cart = user_1.carts.create

            cart.items << Item.last
            cart.items << Item.first
            cart.save

            
            
        
    
    







    