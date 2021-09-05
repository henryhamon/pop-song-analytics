/// 
Class dc.bi.PopSongsCube Extends %DeepSee.CubeDefinition [ DependsOn = dc.bi.PopSongs, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="PopSongs" displayName="Pop Songs Analytics" disabled="false" abstract="false" sourceClass="dc.bi.PopSongs" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="year" disabled="false" hasAll="false" allCaption="All year" allDisplayName="year" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="year" disabled="false" sourceProperty="year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="genre1" disabled="false" hasAll="false" allCaption="All genre1" allDisplayName="genre1" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="genre" disabled="false" sourceProperty="genre" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="danceability" disabled="false" hasAll="false" allCaption="All danceability" allDisplayName="danceability" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="danceability" disabled="false" sourceProperty="danceability" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="durationms" disabled="false" hasAll="false" allCaption="All durationms" allDisplayName="durationms" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="durationms" disabled="false" sourceProperty="durationms" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="artist" disabled="false" hasAll="false" allCaption="All artist" allDisplayName="artist" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="artist" disabled="false" sourceProperty="artist" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="7">
      </level>
      <level name="title" disabled="false" sourceProperty="title" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="9">
      </level>
      <level name="loudness" disabled="false" sourceProperty="loudness" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <measure name="energy" disabled="false" sourceProperty="energy" aggregate="SUM" type="number" hidden="false" searchable="false" factNumber="1">
  </measure>
  <measure name="tempo" disabled="false" sourceProperty="tempo" aggregate="SUM" type="number" hidden="false" searchable="false" factNumber="2">
  </measure>
  <measure name="weeks" disabled="false" sourceProperty="weeks" aggregate="COUNT" type="string" hidden="false" searchable="false" factNumber="3">
  </measure>
  <measure name="year" disabled="false" sourceProperty="year" aggregate="COUNT" type="string" hidden="false" searchable="false" factNumber="4">
  </measure>
  <listing name="New_listing1" disabled="false" listingType="table" fieldList="key">
  </listing>
</cube>
}

Parameter DOMAIN;

}

