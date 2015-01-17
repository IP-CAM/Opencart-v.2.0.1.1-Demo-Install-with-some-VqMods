<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>

                        	
					<script type="text/javascript" src="catalog/view/javascript/jquery/dynamicdrive/scrolltopcontrol.js"></script>
					
					<!-- DynamicDrive License restriction
					/***********************************************
					* Scroll To Top Control script- &copy; Dynamic Drive DHTML code library (www.dynamicdrive.com)
					* This notice MUST stay intact for legal use
					* Visit Project Page at http://www.dynamicdrive.com for full source code
					***********************************************/
					-->
                        	
                        
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>

			
				<script type="text/javascript" src="vqmod/js/livequery.js"></script>
				<script type="text/javascript" src="vqmod/js/infinitescroll.js"></script>
				<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.total-storage.min.js"></script>
				<script>		

					//iScroll object creation
					function iScroll(item, links, container){

						this.display_type = $.totalStorage('display');
						
						this.item = item;
						this.links = links;
						this.container = container;

						if((typeof(this.item) == 'undefined') && (typeof(this.container) == 'undefined') && (typeof(this.links) == 'undefined')){
						
							if(this.display_type == 'grid'){
							
								this.item = $('.product-grid :first-child').attr('class');
								this.links = $('.pagination :first-child').attr('class');
								this.container = 'product-grid';
								
							} else {
							
								this.item = $('.product-list :first-child').attr('class');
								this.links = $('.pagination :first-child').attr('class');
								this.container = 'product-list';		
							
							}
						
						}
						
						//Environment update function when needed
						this.update = update;
						function update(iScroll){
						
							this.display_type = $.totalStorage('display');
							
							if(this.display_type == 'grid'){
							
								this.item = $('.product-grid :first-child').attr('class');
								this.links = $('.pagination :first-child').attr('class');
								this.container = 'product-grid';
								
								$("." + iScroll.item).each(function(){
								
									$(this).css('display','inline-block';
								
								});
								
							} else {
							
								this.item = $('.product-list :first-child').attr('class');
								this.links = $('.pagination :first-child').attr('class');
								this.container = 'product-list';		
								
								$("." + iScroll.item).each(function(){
								
									$(this).css('display','block';
								
								});
								
							}
							
						}
						
					}

					$(document).ready(function(){
						
						/*
							------------------------------------------------------------------------------------------------
							iScroll, an extension of infiniteScroll wordpress plugin made for Opencart
							------------------------------------------------------------------------------------------------
						   
							+ Var declarations
						   
							iScroll.display_type -> product-grid || product-list depending on user's viey choice
							iScroll.item -> selector of each product on the layout
							iScroll.container -> selector of the container where $items are going to be pasted
							iScroll.links -> selector of the next product pages.
							
							Loader bar customization by setting the color (with hex code)
							Defaults: colorone: '#ed3080' || colortwo: '#e6ed30'
							
							Scripts that form part of iScroll
							
							+ Livequery jQuery +
							
								+ Copyright (c) 2010 Brandon Aaron (http://brandonaaron.net)
								+ Dual licensed under the MIT (MIT_LICENSE.txt)
								+ and GPL Version 2 (GPL_LICENSE.txt) licenses.
								+ Version: 1.1.1
								+ Requires jQuery 1.3+
								+ Docs: http://docs.jquery.com/Plugins/livequery
								+ https://github.com/brandonaaron/livequery
									
							+ infiniteScroll +
								
								+ https://github.com/paulirish/infinite-scroll
								+ version 2.0b2.120519
								+ Copyright 2011/12 Paul Irish & Luke Shumard
								+ Licensed under the MIT license	
								+ Documentation: http://infinite-scroll.com/
							
							+ Good luck with your sales!
							
						*/
						
						//Initialize variables for work environment
						iScroll = new iScroll();

						/*
						
							+ For manual set of selectors edit the above constructor
							+ Example: iScroll = new iScroll('product-selector-class', 'links-selector-class', 'container-selector-class');
						
						*/
						
						
						//View type watcher	
						$('.display').live("click",function(){
							
							iScroll.update(iScroll);
							
						});	
						
						//Sorting up not useful elements
						$('.limit, .results').remove();
						$('.pagination').css('z-index','-1');
						
						//Counting existing products on the displyed page
						var oldcount =  $("." + iScroll.item).length;
						
						//infiniteScroll Core 
						$('.' + iScroll.container).infinitescroll({
						
							navSelector  : ".pagination " + "." + iScroll.links,
							nextSelector : ".pagination " + "." + iScroll.links + " a",    
							itemSelector : "." + iScroll.item, 
							animate: true,
							colorone: '#ed3080',
							colortwo: '#e6ed30'
							
						},function(){
						
							var oldcount =  $("." + iScroll.item).length;
							
						});
						
						$("." + iScroll.item).livequery(function(){
				
							$(this).each(function() {
							
								var newcount =  $("." + iScroll.item).length;
								
								if (newcount > oldcount) {
									
									$('#infscr-loading').remove();
									
									//New elements sort-up
									$(this).hide().fadeIn(1000, function(){
												
										$('#iscroll_loader').fadeOut(250, function(){ $(this).remove(); });
											
									});
									
								}
										
							});
				
						});
						
					});
				</script>
			
</head>
<body class="<?php echo $class; ?>">
<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
      </ul>
    </div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-5"><?php echo $search; ?>
      </div>
      <div class="col-sm-3"><?php echo $cart; ?></div>
    </div>
  </div>
</header>
<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>
