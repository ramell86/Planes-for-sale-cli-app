
 require 'open-uri'
 require 'nokogiri'
require 'pry'

class PlanesForSale::Scraper

      attr_accessor :plane_title, :plane_desc, :dealer_info, :dealer_phone

      Planesforsale_url = 'https://www.controller.com/listings/aircraft/for-sale/list/category/13/aircraft/manufacturer/cessna/model-group/182'
      plane_url = "https://www.controller.com/listings/aircraft/for-sale/*"
      
      @planes = []


      def get_page
            Nokogiri::HTML(open(Planesforsale_url))
            
      end


      
     def self.scrape_plane_index
            doc = Nokogiri::HTML(open("/home/andrew/code/labs/planes_for_sale/Controller.com _ CESSNA TURBO 182T SKYLANE For Sale - 125 Listings - Page 1..html"))
            
            doc.css('.listings-list').each do |plane|
                  plane.css('.border-bottom').each do |airplane|
                  
                  PlanesForSale::Plane.new_from_index(airplane)

              end
             end

      end

      def scrape_url
             doc = Nokogiri::HTML(open("/home/andrew/code/labs/planes_for_sale/Controller.com _ CESSNA TURBO 182T SKYLANE For Sale - 125 Listings - Page 1..html"))
            
            doc.css('.listings-list').each do |plane|
                  plane.css('.border-bottom').each do |airplane|
                  Plane.url(airplane)
                  binding.pry
            

                  end
            end
      end
      
      # def self.scrape
      #    doc = Nokogiri::HTML(open(Planesforsale_url))
      # #      doc.search('.listing-name')oc
      
      #       doc.css('.listings-list').each do |plane|
                  
      #             plane.css('.border-bottom').each do |airplane|
                        
      #                   # plane_listing = self.new

      #                   # plane_listing.plane_title = airplane.css('.listing-name').text
      #                   # plane_listing.plane_desc = airplane.css('.equip-details .m-bottom-5').text
      #                   # plane_listing.dealer_info = airplane.css('.dealer-info .bold').text
      #                   # plane_listing.dealer_phone = airplane.css('.call-it-listing a').text
                        
      #                   # @planes << plane_listing
                        
      #                   # total_time = airplane.css()
      #                   # avionics = airplane.css('page.text.match('total')')          
      #             end
      #       end
      # end
      
      

      # def create_planes
      #       scrape_plane_index.each do |airplane|
            
      #       PlanesForSale::Plane.new_from_index(airplane)
      #       @airplane = airplane
      #       end

      # end




      # def self.dealer_scrape
      #       scrape_plane_page.airplane.css('.dealer-info .bold').text
      #       binding.pry

      # end
    def self.scrape_profile_page(airplane)
          self.scrape_url.css('div.listing-name a').first.attr('href')
         doc = Nokogiri::HTML(open(plane_page))
         binding.pry

    end

end