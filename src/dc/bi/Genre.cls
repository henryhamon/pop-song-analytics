Class dc.bi.Genre Extends %Persistent
{

Property name As %String;

Index nameIdx On name [ Unique ];

Relationship songs As dc.bi.SongsGenres [ Cardinality = many, Inverse = genre ];

Storage Default
{
<Data name="GenreDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<DataLocation>^dc.bi.GenreD</DataLocation>
<DefaultData>GenreDefaultData</DefaultData>
<IdLocation>^dc.bi.GenreD</IdLocation>
<IndexLocation>^dc.bi.GenreI</IndexLocation>
<StreamLocation>^dc.bi.GenreS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
