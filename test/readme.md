#Installation and running tests

##Set­up and running instructions
 ● You will need to install Ruby 2.4.x (this was written on 2.4.1p111).
 
 ● Install the ruby gem bundler using the command `gem install bundler`
 
 ● Once installed navigate to the root of the test folder, and run `bundler install` which should install all the required gems 
 
 ● To run the tests, navigate to the 'test' folder and run the command `rake search`. Alternatively you can run the tests with the command `cucumber` 
 
 ```
 ---->>> Cucucmber feature file: holds the scenarios and steps, these call the step definitions
   |
   |
 ---->>> Step definitions: clean step definitions, we conduct assertions and expectations at this level by calling the helpers
   |
   |
 ---->>> Helpers: using page objects user flows can be built, conditional logic about flows can also be added here. most of the complicated work will be done at this level. if the logical flow of functionality is to be changed it can be handled here
   |
   |
 ---->> Page objects: UI Interactions level, here we have the pure interactions that keep element identifiers for specific pages or page areas, which cuts down code reuse and improves maintainability
 ```
 Due to not having full data control (either through clean environment set up, or test tear down), this test suite creates the pages it requires with a randomly generated name. 
 With bette control of the environment data it would be possible to standadize these names and keep the atomic nature of the tests.


 

 