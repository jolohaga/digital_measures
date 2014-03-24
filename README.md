## DigitalMeasures

A Ruby gem for mapping data between hashes and attributes, and DigitalMeasures compatible XML.

Depends on Nokogiri, Typhoeus, and Virtus.

The DigitalMeasures resources presently recognized are: User, UserSchema, DeleteUser, UserRole, SchemaData (SCHTEACH).

Examples:

* Mapping a user's attributes to DigitalMeasures XML:

      ```ruby
      params = { first_name: "Bilbo", last_name: "Baggins", email: "bilbo@uci.edu", local_authentication: "secret", username: "bilbo" }
      resource = DigitalMeasures::User.new(params)
      resource.to_xml.to_s
      
      # Produces
      <User username="bilbo">
        <FirstName>Bilbo</FirstName>
        <LastName>Baggins</LastName>
        <Email>bilbo@uci.edu</Email>
        <LocalAuthentication>secret</LocalAuthentication>
      </User>
      ```

* Mapping a user schema:

      ```ruby
      params = { ac_year: '2013-2014', college: 'Social Sciences', dep: 'Anthropology', username: 'bilbo' }
      resource = DigitalMeasures::UserSchema.new(params)
      puts resource.to_xml.to_s
      
      # Produces
      <INDIVIDUAL-ACTIVITIES-University>
        <ADMIN>
          <AC_YEAR>2013-2014</AC_YEAR>
          <ADMIN_DEP>
            <COLLEGE>Social Sciences</COLLEGE>
            <DEP>Anthropology</DEP>
          </ADMIN_DEP>
        </ADMIN>
      </INDIVIDUAL-ACTIVITIES-University>

* Mapping XML to Hash:

      ```ruby
      user = DigitalMeasures::User.from_xml(%{
               <User username="bilbo">
                 <FirstName>Bilbo</FirstName>
                 <LastName>Baggins</LastName>
                 <Email>bilbo@uci.edu</Email>
                 <LocalAuthentication>secret</LocalAuthentication>
               </User>})
      user.to_hash
      
      # Produces
      {:first_name=>"Bilbo", :middle_name=>nil, :last_name=>"Baggins", :email=>"bilbo@uci.edu", :local_authentication=>"secret"}
      ```