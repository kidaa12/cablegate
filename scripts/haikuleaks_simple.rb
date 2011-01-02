require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Get a Nokogiri::HTML:Document for the page we’re interested in...

doc = Nokogiri::HTML.parse(File.open('../haikuleaks/index_old.html'))

haikuleaks = []

doc.css('li').each do |haiku|
  content = haiku.css('.snip').first.content.strip
  ref = haiku.css('a').first.content.gsub(".txt", "").strip
  haikuleaks << [content, ref]
  unless ref == "oldhaikus"
    File.open("../haikuleaks/poetry/#{ref}.html", 'w') do |file|
      file.write(
      "
      <!DOCTYPE html>
      <html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
              <title>HaïkuLeaks / Cable is poetry</title>

      <style type='text/css'>
      /* haikuleaks */

      body .wrap {
      margin:0 auto 5em;
      width:612px;
      color:#222222;
      position:relative;
      text-rendering:optimizelegibility;
      color:#353535;
      font:18px/25px Palatino,'Palatino Linotype',serif;
      text-decoration:none;
      }

      .section-listing ol {
      list-style-type:none;
      }
      ol {
      list-style:decimal outside none;
      }
      p, ul, ol, dl, blockquote, pre {
      margin:0 0 25px;
      }
      .section-listing ol {
      list-style-type:none;
      }
      ol {
      list-style:decimal outside none;
      }
      p, ul, ol, dl, blockquote, pre {
      margin:0 0 25px;
      }
      .section-listing ol li a {
      /*color:#222222;*/
      display:block;
      font:11px/16px 'OFL Sorts Mill Goudy','OFL Sorts Mill Goudy TT',serif;
      }


      .section-listing ol li span.snip {
      color:#333333;
      font-family:'OFL Sorts Mill Goudy','OFL Sorts Mill Goudy TT',serif;
      font-size:18px;
      font-style:italic;
      line-height:25px;
      }
      body .wrap .top header a {
      color:#355155;
      }
      body a {
      color:#83b4c3;
      text-decoration:none;
      }
      </style>        

          </head>

          <body><div id='cboxOverlay' style='display: none; '></div><div id='colorbox' style='padding-bottom: 57px; padding-right: 28px; display: none; '><div id='cboxWrapper'><div><div id='cboxTopLeft' style='float: left; '></div><div id='cboxTopCenter' style='float: left; '></div><div id='cboxTopRight' style='float: left; '></div></div><div><div id='cboxMiddleLeft' style='float: left; '></div><div id='cboxContent' style='float: left; '><div id='cboxLoadedContent' style='width: 0px; height: 0px; ' class=' '></div><div id='cboxLoadingOverlay' class=' '></div><div id='cboxLoadingGraphic' class=' '></div><div id='cboxTitle' class=' '></div><div id='cboxCurrent' class=' '></div><div id='cboxSlideshow' class=' '></div><div id='cboxNext' class=' '></div><div id='cboxPrevious' class=' '></div><div id='cboxClose' class=' '></div></div><div id='cboxMiddleRight' style='float: left; '></div></div><div><div id='cboxBottomLeft' style='float: left; '></div><div id='cboxBottomCenter' style='float: left; '></div><div id='cboxBottomRight' style='float: left; '></div></div></div><div style='position:absolute; top:0; left:0; width:9999px; height:0;'></div></div>
              <div class='wrap'>
                  <div class='top group'>
                      <header>
                         <img src='/images/haikuleaks.jpg' border='0'> <a href='http://haikuleaks.tetalab.org/'>Haïkuleaks</a>
      		</header>

      		<nav>
      			Cable is poetry  
                          <i>65 haikus in 1830 cables</i>
                      </nav>
                  </div>

                  <div class='hr'>&nbsp;</div>

                  <div class='content'>



          <div class='section-listing'>
              <ol class='group'>


      <li><div class='snip'>
      #{content.gsub(/\n/, '<br>').gsub(/\302\240/, '&nbsp')}
      </div><i><a href='http://git.tetalab.org/index.php/p/cablegate/source/tree/master/cables/#{ref}.txt'>
              #{ref}.txt


          </a></i></li>

              </ol>
          </div>



                  </div>

                  <div class='hrb'>&nbsp;</div>

                  <footer>
                  </footer>
              </div>


      </body></html>
    
      ")
    end
  end
end

File.open("../haikuleaks/index.html", 'w') do |file|
  index = "
  <!DOCTYPE html>
  <html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
          <title>HaïkuLeaks / Cable is poetry</title>

  <style type='text/css'>
  /* haikuleaks */

  body .wrap {
  margin:0 auto 5em;
  width:612px;
  color:#222222;
  position:relative;
  text-rendering:optimizelegibility;
  color:#353535;
  font:18px/25px Palatino,'Palatino Linotype',serif;
  text-decoration:none;
  }

  .section-listing ol {
  list-style-type:none;
  }
  ol {
  list-style:decimal outside none;
  }
  p, ul, ol, dl, blockquote, pre {
  margin:0 0 25px;
  }
  .section-listing ol {
  list-style-type:none;
  }
  ol {
  list-style:decimal outside none;
  }
  p, ul, ol, dl, blockquote, pre {
  margin:0 0 25px;
  }
  .section-listing ol li a {
  /*color:#222222;*/
  display:block;
  font:11px/16px 'OFL Sorts Mill Goudy','OFL Sorts Mill Goudy TT',serif;
  }


  .section-listing ol li span.snip {
  color:#333333;
  font-family:'OFL Sorts Mill Goudy','OFL Sorts Mill Goudy TT',serif;
  font-size:18px;
  font-style:italic;
  line-height:25px;
  }
  body .wrap .top header a {
  color:#355155;
  }
  body a {
  color:#83b4c3;
  text-decoration:none;
  }
  </style>        

      </head>

      <body><div id='cboxOverlay' style='display: none; '></div><div id='colorbox' style='padding-bottom: 57px; padding-right: 28px; display: none; '><div id='cboxWrapper'><div><div id='cboxTopLeft' style='float: left; '></div><div id='cboxTopCenter' style='float: left; '></div><div id='cboxTopRight' style='float: left; '></div></div><div><div id='cboxMiddleLeft' style='float: left; '></div><div id='cboxContent' style='float: left; '><div id='cboxLoadedContent' style='width: 0px; height: 0px; ' class=' '></div><div id='cboxLoadingOverlay' class=' '></div><div id='cboxLoadingGraphic' class=' '></div><div id='cboxTitle' class=' '></div><div id='cboxCurrent' class=' '></div><div id='cboxSlideshow' class=' '></div><div id='cboxNext' class=' '></div><div id='cboxPrevious' class=' '></div><div id='cboxClose' class=' '></div></div><div id='cboxMiddleRight' style='float: left; '></div></div><div><div id='cboxBottomLeft' style='float: left; '></div><div id='cboxBottomCenter' style='float: left; '></div><div id='cboxBottomRight' style='float: left; '></div></div></div><div style='position:absolute; top:0; left:0; width:9999px; height:0;'></div></div>
          <div class='wrap'>
              <div class='top group'>
                  <header>
                     <img src='/images/haikuleaks.jpg' border='0'> <a href='http://haikuleaks.tetalab.org/'>Haïkuleaks</a>
  		</header>

  		<nav>
  			Cable is poetry  
                      <i>65 haikus in 1830 cables</i>
                  </nav>
              </div>

              <div class='hr'>&nbsp;</div>

              <div class='content'>



      <div class='section-listing'>
          <ol class='group'>

    "
    haikuleaks.each do |haiku|
      content, ref = haiku
    index << "  <li><div class='snip'>
  #{content.gsub(/\n/, '<br>').gsub(/\302\240/, '&nbsp')}
  </div><i><a href='/poetry/#{ref}.html'>
          #{ref}.txt


      </a></i></li>"
    end
index << "
          </ol>
      </div>



              </div>

              <div class='hrb'>&nbsp;</div>

              <footer>
                  Here is the
                  <a href='http://git.tetalab.org/index.php/p/cablegate/source/tree/master/haikuleaks'>code</a>, thanks to Alex for the <a href='http://git.tetalab.org/index.php/p/cablegate/'>cablegate text version</a> and Jonathan Feinberg for the <a href='https://github.com/jdf/haikufinder'>haikufinder</a><br>
  Fabrice / Tetalab
              </footer>
          </div>


  </body></html>

  "
  file.write(index)
end