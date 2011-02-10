= Vollyball

* http://www.bitbucket.org/digger250/volleyball

== DESCRIPTION:

A small library for yes/no voting on ActiveRecord models.

== FEATURES/PROBLEMS:

* None yet

== SYNOPSIS:

voteable

== REQUIREMENTS:

* Must have a model called user

== INSTALL:

* gem install vollball
* Create a new rails migration and add the following self.up and self.down methods

 def self.up
   create_table "votes", :force => true do |t|
     t.boolean :up, {:null=>false}
     t.string :subject_type, {:null=>false}
     t.integer :subject_id, {:null=>false}
     t.integer :user_id, {:null=>false}
     t.timestamps
   end
 
   add_index "votes", ["user_id"], :name => "fk_votes_user"
 end

 def self.down
   drop_table :votes
 end


* Add yes_votes/no_votes columns for vote rollup and score on the table you count votes for:
  add_column :my_objects, :yes_votes, :integer, {:default => 0, :null=>false}
  add_column :my_objects, :no_votes, :integer, {:default => 0, :null=>false}
  add_column :my_objects, :score, :float

== LICENSE:

(The MIT License)

  Copyright (c) 2010 Justin Coyne

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
      'Software'), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
