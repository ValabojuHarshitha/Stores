// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
function add_list(store_value)
{
    var store_id=store_value;
    //alert(store_id);
    var customer_store = 'store_id=' + store_id;
    $.ajax({url: '../customer/user_store_list',data: customer_store});
}
function view_category_list(store_value)
{
    var store_id=store_value;
    var user_store = 'store_id=' + store_id;

    $.ajax({url: '../customer/store_category_list',data: user_store});

}

var allVals = [];
function updateTextArea() {
    var alluncheck = [];


    $('#cab :checked').each(function() {
        allVals.push($(this).val());
    });
    $('#cab :not(:checked)').each(function() {
        alluncheck.push($(this).val());
    });
    //allVals=allVals.uniq();
    allVals = $.unique(allVals);
    //alert(allVals + "uniq")
    //alert(alluncheck + "unselect")
    var foo = [];
    var i = 0;
    jQuery.grep(allVals, function(el) {

        if (jQuery.inArray(el, alluncheck) == -1) foo.push(el);

        i++;
    });
    allVals = foo;
      //alert(foo)
    //alert(" the difference is " + foo);
    var item_list='item_arry=' + allVals;
    $.ajax({url: '../customer/right_item_list',data: item_list})

    //$('#t').val(allVals)
}
function removeItems(sc_id,item_id) {
    var notrequireitems = [];
    $('#check :checked').each(function() {
        notrequireitems.push($(this).val());
    });
    var foo = [];
    var i = 0;
    jQuery.grep(allVals, function(el) {

        if (jQuery.inArray(el, notrequireitems) == -1) foo.push(el);

        i++;
    });
    allVals = foo;
    //var item_list='item_arry=' + allVals + '&st_id=' +sc_id ;
    $.ajax({url: '../customer/right_item_list',data: 'item_arry=' + allVals + '&st_id=' +sc_id})

    var a= '#' + item_id;
         if ($(a).length>0) {
        $(a).prop('checked', false);
        alert(a);
    }
}
var test_arry =[]
function removeFormList(item_id,all)
{
    var quantity_selected = [];
    var a= '#list' + item_id;
    $(a).remove();
    if(test_arry.length==0)
    {
        test_arry = all;
    }
    var remove_item_id= item_id.toString();
    test_arry.splice( $.inArray(remove_item_id,test_arry) ,1 );
    var total_all=0
    for(var i=0;i<test_arry.length;i++)
    {
        var fetch_div_value="#quantitys" + test_arry[i];
        var   div_value=  $(fetch_div_value).text();
        total_all = parseInt(div_value)+total_all
        var fetch_quan= "#quantity" + test_arry[i];
        var   select_quan_value=  $(fetch_quan).val();
        quantity_selected.push(select_quan_value);

    }
    $("#total_value").html(total_all);
    // alert(quantity_selected + "arrau"+  test_arry);
    $.get("/customer/fav_list", { item_id: item_id, item_ids: test_arry ,quantities: quantity_selected } );
}
function quantity_total(quantity,price,item_id,all)
{

    if(test_arry.length==0)
    {
    var items = all;
    }
    else{
        var items = test_arry;
        alert(test_arry);
    }
           var total_single=quantity * price;
    var a= '#quantitys' + item_id;
    $(a).html(total_single);
        var total_all=0
    for(var i=0;i<items.length;i++)
    {
        var fetch_div_value="#quantitys" + items[i];
        var   div_value=  $(fetch_div_value).text();

        total_all = parseInt(div_value)+total_all
    }
    $("#total_value").html(total_all);
}




