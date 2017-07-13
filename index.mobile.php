<!DOCTYPE HTML>
<html>
<head><title>team-holm.net</title>
   <meta name="description" content="Atle Holm, Personalia, Utdanning, Notater, Interesser, Lenker" />
   <meta name="keywords" content="Atle, Holm, Atle Holm, IT, ranting, blogg, IT-blogg, Scripts, BASH, PERL, PowerShell, VBS, VisualBasic, Java, free code, code, rollespill, AD&ampD, software, free software, Linux" />
   <meta name="author" content="Atle Holm" />
   <meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
   <style type="text/css">
       .pace .pace-progress {
           background: #ff0000;
           position: fixed;
           z-index: 2000;
           top: 0;
           left: 0;
           height: 3px;
           -webkit-transition: width 1s;
           -moz-transition: width 1s;
           -o-transition: width 1s;
           transition: width 1s;
       }

       .pace-inactive {
           display: none;
       }
   </style>
   <link rel="Stylesheet" type="text/css" href="css/lightbox.css"  />
   <link rel="Stylesheet" type="text/css" href="css/myWeather.css"  />
   <link rel="Stylesheet" type="text/css" href="css/mobile-styles.css" />
   <link rel="Stylesheet" type="text/css" href="css/myStyle.css?v=0007" />
   <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
   <!-- Optional theme -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">    
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    
   <!-- Latest compiled and minified JavaScript -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
   <script type="text/javascript" src="js/pace.min.js"></script>
   <script type="text/javascript" src="js/lightbox.js"></script>
   <script type="text/javascript" src="js/myWeather.js"></script>
   <script type="text/javascript" src="js/myFunctions.js?v=0006"></script>

<script type="text/javascript">
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-47427351-3', 'team-holm.net');
  ga('send', 'pageview');

</script>
</head>
<body style="padding-top:0px;">
    <div class="page-container">
        <!-- top navbar -->
       <nav class="navbar navbar-inverse">
          <div class="container-fluid">
             <div class="navbar-header">
                <a class="navbar-brand" href="/">team-holm.net</a>
             </div>
             <ul class="nav navbar-nav" id="navbar">
                <li id="itemPersonalia">
                   <a href="#" onmousedown="printPersonalia( );" onmouseup="$('div.banner').removeClass('banner');">
                      <?php echo ucfirst(utf8_encode($translation->getTranslation("personalia"))); ?>
                   </a>
                </li>
                <li id="itemEdu">
                   <a href="#section1" onmousedown="printEdu( );" onmouseup="$('div.banner').removeClass('banner');">
                      <?php echo ucfirst(utf8_encode($translation->getTranslation("utdanning"))); ?>
                   </a>
                </li>
                <li id="itemSharing">
                   <a href="#section2" onmousedown="printSharing( );" onmouseup="$('div.banner').removeClass('banner');">CODE</a>
                </li>
                <li id="itemInt">
                   <a href="#section3" onmousedown="printInt( );" onmouseup="$('div.banner').removeClass('banner');">
                      <?php echo ucfirst(utf8_encode($translation->getTranslation("interesser"))); ?>
                   </a>
                </li>
                <li id="itemLinks">
                   <a href="#section4" onmousedown="printLinks( );" onmouseup="$('div.banner').removeClass('banner');">
                      <?php echo ucfirst(utf8_encode($translation->getTranslation("lenker"))); ?>
                   </a>
                </li>
             </ul>
             <ul id="languageSelections" class="nav navbar navbar-nav navbar-right">
                <li>
                   <a href="<?php echo $localPage."/?lang=no" . ($shigarName != "" ? "&sn=" . $shigarName : ""); ?>" name="languageLink" title="Choose language.." onmouseup="$('div.banner').removeClass('banner');">
                      <img src="images/flags/Norway.png" />
                   </a>
                </li>
                <li>
                   <a href="<?php echo $localPage."/?lang=is" . ($shigarName != "" ? "&sn=" . $shigarName : ""); ?>" name="languageLink" title="Choose language.." onmouseup="$('div.banner').removeClass('banner');">
                      <img src="images/flags/Iceland.png" />
                   </a>
                </li>
                <li>
                   <a href="<?php echo $localPage."/?lang=en" . ($shigarName != "" ? "&sn=" . $shigarName : ""); ?>" name="languageLink" title="Choose language.." onmouseup="$('div.banner').removeClass('banner');">
                      <img src="images/flags/United-Kingdom.png" />
                   </a>
                </li>
             </ul>
          </div>
       </nav>
        <div class="container">
            <div class="row">
                <!-- main area -->
               <div class="col-xs-12 col-sm-12" data-spy="scroll">
                  <!--<div class="jumbotron center-block">
                     <h2>Mobile version not ready..</h2>
                     <p class="small">Use your PC to browse this site if you want to see the contents..</p>
                  </div>-->
                  <div>
                     <h1 id="divHeader">
                         Welcome!
                        <br />
                     </h1>
                     <br />
                     <a name="field">
                        <div id="divField" class="centerText">
                            Please browse the links..
                            <br/>
                            <br />
                           <!--<img src="images/10639735_s.jpg" height="285" width="401" />-->
                            <h3 style="color: black;">
                                This mobile content is fairly new, and is still under construction.<br/>
                                For full website functionality, please browse this website with a regular computer..
                            </h3>
                           <br />
                           <br />
                        </div>
                     </a>
                  </div>                  
               </div><!-- /.col-xs-12 main -->
         </div><!--/.row-->
   </div><!--/.container-->
</div><!--/.page-container-->

    <div id="footer">
        <!--footer-->
        <div class="container">
            <div class="row">
               <div id="wxWrap" style="margin-left:auto; margin-right:auto;">
                  <span id="wxIntro">
                     <script type="text/javascript" language="javascript">
							$('#wxIntro').html(setText('wxIntro'));
                     </script>
                  </span>
                  <span id="wxIcon2"></span>
                  <span id="wxTemp"></span>
               </div>
            </div><!--/row-->
        </div><!--/container-->
    </div><!--/footer-->
    <script type="text/javascript">
      $(document).ready(function () {
               $('div.banner').removeClass('banner');
      });
    </script>
    <style type="text/css">
        #footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            /* Set the fixed height of the footer here */
            height: 80px;
            background-color: #222222;
            border: 0 solid #080808;
            border-top-width: 1px;
            margin-top: 50px;
            z-index: 100;
        }
    </style>
</body>
</html>