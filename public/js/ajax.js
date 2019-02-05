$('.add-to-cart').click(function(){
	let qty = $('.pro-qty input').val();
	let id  = $(this).data('id');
	$.ajax({
		headers: {
          'X-CSRF-TOKEN': $('input[name="_token"]').val()
        },
		type:'POST',
		url:'/add_to_cart',
		data:{id:id,qty:qty},
		success:function(msg){
			console.log(msg);
			(msg.code == 1) ? location.reload() : (msg.code == 2) ? ($('.error').fadeIn().find('.error_text').text('На складе всего '+msg.items+' шт.'),setTimeout(function(){$('.error').fadeOut()},5000)) : console.log(msg);			
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