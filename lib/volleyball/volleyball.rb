require 'statistics2'

module Volleyball
  
  module Base
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def votable(args={})
        class_eval do
          has_many :votes, :as => :subject
          before_save :calculate_score
          cattr_accessor :yes_adjustment
          cattr_accessor :no_adjustment
          self.yes_adjustment = args[:yes_start] || 0
          self.no_adjustment = args[:no_start] || 0

          include InstanceMethods
        end
      end
    end
    
    module InstanceMethods
      def calculate_score
        self.score = (rank * 100).floor.to_f / 10
      end

      def rank 
        adjusted_yes_votes = self.yes_votes + self.class.yes_adjustment
        adjusted_total_votes = self.no_votes + adjusted_yes_votes + self.class.no_adjustment
        ci_lower_bound(adjusted_yes_votes, adjusted_total_votes, 0.10) 
      end  

      # This is the Wilson Confidence Interval
      # http://www.evanmiller.org/how-not-to-sort-by-average-rating.html
      def ci_lower_bound(pos, n, power)
        return 0 if n == 0
        z = Statistics2.normaldist(1-power/2)
        phat = 1.0*pos/n
        (phat + z*z/(2*n) - z * Math.sqrt((phat*(1-phat)+z*z/(4*n))/n))/(1+z*z/n)
      end
    end
  end
end

