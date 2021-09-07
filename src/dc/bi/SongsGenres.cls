Class dc.bi.SongsGenres Extends %Persistent
{

Relationship song As dc.bi.PopSongs [ Cardinality = parent, Inverse = genres ];

Relationship genre As dc.bi.Genre [ Cardinality = one, Inverse = songs ];

Index genreIndex On genre;

Storage Default
{
<Data name="SongsGenresDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>genre</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("genres")</DataLocation>
<DefaultData>SongsGenresDefaultData</DefaultData>
<IdLocation>^dc.bi.PopSongsC("genres")</IdLocation>
<IndexLocation>^dc.bi.SongsGenresI</IndexLocation>
<StreamLocation>^dc.bi.SongsGenresS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
