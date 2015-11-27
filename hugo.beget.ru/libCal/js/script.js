$(document).ready(function(){
	
	// ������� select, ������� ����� ����������:
	var select = $('select.makeMeFancy');

	var selectBoxContainer = $('<div>',{
		width		: select.outerWidth(),
		className	: 'tzSelect',
		html		: '<div class="selectBox"></div>'
	});

	var dropDown = $('<ul>',{className:'dropDown'});
	var selectBox = selectBoxContainer.find('.selectBox');
	
	// ���� �� ������������� �������� select
	
	select.find('option').each(function(i){
		var option = $(this);
		
		if(i==select.attr('selectedIndex')){
			selectBox.html(option.text());
		}
		
		// ��� ��� ������������ jQuery 1.4.3, �� �� ����� �������� ������ 
		// � ��������� ������ HTML5 � ������� ������ data().
		
		if(option.data('skip')){
			return true;
		}
		
		// ������� ���������� ����� � ������������
		// � ������� ������ � ���������� HTML5 ������:
		
		var li = $('<li>',{
			html:	'<img src="'+option.data('icon')+'" /><span>'+
					option.data('html-text')+'</span>'
		});
				
		li.click(function(){
			
			selectBox.html(option.text());
			dropDown.trigger('hide');
			
			// ����� ���������� ������� click, �� ����� ��������
			// ��������� � ������������ �������� select:
			select.val(option.val());
			
			return false;
		});
		
		dropDown.append(li);
	});
	
	selectBoxContainer.append(dropDown.hide());
	select.hide().after(selectBoxContainer);
	
	// ����������� ���������������� ������� show � hide � �������� dropDown:
	
	dropDown.bind('show',function(){
		
		if(dropDown.is(':animated')){
			return false;
		}
		
		selectBox.addClass('expanded');
		dropDown.slideDown();
		
	}).bind('hide',function(){
		
		if(dropDown.is(':animated')){
			return false;
		}
		
		selectBox.removeClass('expanded');
		dropDown.slideUp();
		
	}).bind('toggle',function(){
		if(selectBox.hasClass('expanded')){
			dropDown.trigger('hide');
		}
		else dropDown.trigger('show');
	});
	
	selectBox.click(function(){
		dropDown.trigger('toggle');
		return false;
	});

	// ���� ������ ������ ���� ���-������ �� �������� ��� �������� �������� dropDown,
	// �� ����� �������:
	
	$(document).click(function(){
		dropDown.trigger('hide');
	});
});