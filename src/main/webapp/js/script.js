function add_to_cart(pid, pname, pprice)
{
    
    let cart = localStorage.getItem("cart");
    if(cart == null)
    {
       // no Produc yet;
       let products=[];
       let product = {productId: pid, productName: pname,productQuantity:1, productPrice:pprice};
       products.push(product);
       localStorage.setItem("cart", JSON.stringify(products));
        console.log("Product added for the first time");
    }else
    {
        //Already product available
        let pcart = JSON.parse(cart);
        let oldProduct= pcart.find((item)=> item.productId===pid);
        if(oldProduct)
        {
            //We have increase the Quantity
            oldProduct.productQuantity=oldProduct.productQuantity+1;
            pcart.map((item)=>
            {
                if(item.productId===oldProduct.productId)
                {
                    item.productQuantity=oldProduct.productQuantity;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product Quantity iincreased");
            
        }else
        {
            //We have to add the product
             let product = {productId: pid, productName: pname,productQuantity:1, productPrice:pprice};
             pcart.push(product);
             localStorage.setItem("cart", JSON.stringify(pcart));
             console.log("Product is added");
            
        }
    }
    
   updateCart(); 
}

//Update Cart

function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart==null || cart.length==0)
    {
        console.log("cart is empty !!");
        $(".cart-items").html("( 0 )");
        $(".cart-model-body").html("<h3>Cart does not have any items </h3>");
        $(".checkout-btn").addClass('disabled');
    }else
    {
       //There is somthing in this cart
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);
        let table=`
            <table class='table'>
            <thead class='thead-Light'>
            <tr>
            <th>Item Name</th>
            <th>Price</th>
            <th>Quanty</th>
            <th>Total Price</th>
            <th>Action</th>
            </tr>
            </thead>

        `;
        
        
        let totalPrice=0;
        cart.map((item) =>{
           
           table+=`
           <tr>
            <td>${item.productName}</td>
            <td>${item.productPrice}</td>
            <td>${item.productQuantity}</td>
            <td>${item.productQuantity * item.productPrice}</td>
            <td><button onclick='deleteItemFomCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
            </tr>
        `; 
            totalPrice+= item.productQuantity * item.productPrice;
            
            
        });
        
        
        table = table + `
                    <tr><td colspan='6' class='text-center font-weight-bold m-5'>Total Price : ${totalPrice}</td></tr>
                </table>`;
        $(".cart-model-body").html(table);
        
    }
}

//Delete Items

function deleteItemFomCart(pid)
{
    let cart = JSON.parse(localStorage.getItem('cart'));
    
    let newCart = cart.filter((item)=> item.productId !== pid);
    localStorage.setItem('cart', JSON.stringify(newCart));
    
    updateCart();
}

$(document).ready(function ()
{
   updateCart();
});