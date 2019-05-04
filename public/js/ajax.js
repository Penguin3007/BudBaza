$('.add-to-cart').click(function(){
	let qty = $('.pro-qty input').val();
	let id  = $(this).data('id');
	$.ajax({
		headers: {
          'X-CSRF-TOKEN': $('input[name="_token"]').val()
        },
		type:'POST',
		url:'/cart/add',
		data:{id:id,qty:qty},
		success:function(msg){
			(msg.code == 1) ? location.reload() : (msg.code == 2) ? ($('.error').fadeIn().find('.error_text').text('На складе всего '+msg.items+' шт.'),setTimeout(function(){$('.error').fadeOut()},5000)) : (msg.code == 4) ? ($('.error').fadeIn().find('.error_text').text('Заполните пожалуйста форму!'),setTimeout(function(){$('.error').fadeOut()},5000)) : console.log(msg);			
		}
	});
});

$('form#add_review').submit(function(){
	$.ajax({
		headers: {
          'X-CSRF-TOKEN': $('input[name="_token"]').val()
        },
		type:'POST',
		url:'/add_review',
		data:$(this).serialize(),
		success:function(msg){
			console.log(msg);
			(msg.code == 1) ? location.reload() : (msg.code == 3) ? ($('.error').fadeIn().find('.error_text').text('Вы уже оставили свой отзыв на этот товар'),setTimeout(function(){$('.error').fadeOut()},5000)) : (msg.code == 2) ? ($('.error').fadeIn().find('.error_text').text('Что-то пошло не так, перезагрузите страницу и попробуйте еще раз'),setTimeout(function(){$('.error').fadeOut()},5000)) : console.log(msg);			
		}
	});
});

$('#cart_quan').on('input',function(){
	if($(this).val() != '' && $(this).val() != 0)
		$.ajax({
	        headers: {
	            'X-CSRF-TOKEN': $('input[name="_token"]').val()
	        },
	        type:'POST',
	        url:'/cart/update',
	        data: {id:$(this).data('id'),val:$(this).val()},
	        beforeSend:function(){
	            $('.loaderArea').fadeIn().find('.loader').fadeIn();
	        },
	        success:function(msg){
	            $('.loaderArea').fadeOut().find('.loader').fadeOut();
	            (msg.code == 2) ? ($('.error').fadeIn().find('.error_text').text('На складе всего '+msg.items+' шт.'),setTimeout(function(){$('.error').fadeOut()},5000)) : location.reload();
	        }
	    });
});
$('.checkout-form').submit(function(){
	$.ajax({
	    headers: {
	        'X-CSRF-TOKEN': $('input[name="_token"]').val()
	    },
	    type:'POST',
	    url:'/checkout/order',
	    data: $(this).serialize(),
	    beforeSend:function(){
	        $('.loaderArea').fadeIn().find('.loader').fadeIn();
	    },
	    success:function(msg){
	        $('.loaderArea').fadeOut().find('.loader').fadeOut();
	        if(msg.code == 1) location.href = "/";
	    }
	});
});
/* Isotope sorting */
(function ($) {
    var $grid = $('.products-list-grid').isotope({
        itemSelector: '.product-item-wrapper',
        getSortData: {
            'title':        '.title',
            'price-asc':    '.price parseFloat',
            'price-desc':   '.price parseFloat',
            'rating': function( itemElem ) {
                return parseInt($(itemElem).find('.ratting i.fa-star').length);
            }
        },
        sortBy: 'title'
    });

    $('.product-short .nice-select').change(function(){
        let sortBy = $(this).val();
        if(sortBy == 'price-desc' || sortBy == 'rating'){
            $grid.isotope({ sortBy: sortBy, sortAscending: false });
        }else{
            $grid.isotope({ sortBy: sortBy, sortAscending: true });
        }
    });
})(jQuery);