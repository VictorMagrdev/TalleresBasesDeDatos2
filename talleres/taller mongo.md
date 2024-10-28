insertar
~~~mongo
  {
    "ISBN": "9780765311788",
    "titulo": "Elantris",
    "nombreAutor": "Brandon Sanderson",
    "Genero": "Fantasía",
    "año": "2005"
  }
  {
    "ISBN": "9780765360038",
    "titulo": "Mistborn: The Final Empire",
    "nombreAutor": "Brandon Sanderson",
    "Genero": "Fantasía",
    "año": "2006"
  }
  {
    "ISBN": "9780765316882",
    "titulo": "The Well of Ascension",
    "nombreAutor": "Brandon Sanderson",
    "Genero": "Fantasía",
    "año": "2007"
  }
  {
    "ISBN": "9780765316899",
    "titulo": "The Hero of Ages",
    "nombreAutor": "Brandon Sanderson",
    "Genero": "Fantasía",
    "año": "2008"
  }
  {
    "ISBN": "9780765326355",
    "titulo": "Warbreaker",
    "nombreAutor": "Brandon Sanderson",
    "Genero": "Fantasía",
    "año": "2009"
  },
  {
    "ISBN": "9780765326356",
    "titulo": "The Way of Kings",
    "nombreAutor": "Brandon Sanderson",
    "Genero": "Fantasía",
    "año": "2010"
  }
  {
    "ISBN": "9780765326370",
    "titulo": "Words of Radiance",
    "nombreAutor": "Brandon Sanderson",
    "Genero": "Fantasía",
    "año": "2014"
  }
  {
    "ISBN": "9780765326387",
    "titulo": "Oathbringer",
    "nombreAutor": "Brandon Sanderson",
    "Genero": "Fantasía",
    "año": "2017"
  }
  {
    "ISBN": "9780765399834",
    "titulo": "Rhythm of War",
    "nombreAutor": "Brandon Sanderson",
    "Genero": "Fantasía",
    "año": "2020"
  }
  {
    "ISBN": "9780765310011",
    "titulo": "The Alloy of Law",
    "nombreAutor": "Brandon Sanderson",
    "Genero": "Fantasía",
    "año": "2011"
  }
  {
    "ISBN": "9780765314330",
    "titulo": "Gardens of the Moon",
    "nombreAutor": "Steven Erikson",
    "Genero": "Fantasía",
    "año": "1999"
  }
  {
    "ISBN": "9780765310028",
    "titulo": "Deadhouse Gates",
    "nombreAutor": "Steven Erikson",
    "Genero": "Fantasía",
    "año": "2000"
  }
  {
    "ISBN": "9780765310035",
    "titulo": "Memories of Ice",
    "nombreAutor": "Steven Erikson",
    "Genero": "Fantasía",
    "año": "2001"
  },
  {
    "ISBN": "9780765310042",
    "titulo": "House of Chains",
    "nombreAutor": "Steven Erikson",
    "Genero": "Fantasía",
    "año": "2002"
  }
  {
    "ISBN": "9780765310059",
    "titulo": "Midnight Tides",
    "nombreAutor": "Steven Erikson",
    "Genero": "Fantasía",
    "año": "2004"
  },
  {
    "ISBN": "9780765310066",
    "titulo": "The Bonehunters",
    "nombreAutor": "Steven Erikson",
    "Genero": "Fantasía",
    "año": "2006"
  }
  {
    "ISBN": "9780765310073",
    "titulo": "Reaper's Gale",
    "nombreAutor": "Steven Erikson",
    "Genero": "Fantasía",
    "año": "2007"
  }
  {
    "ISBN": "9780765310080",
    "titulo": "Toll the Hounds",
    "nombreAutor": "Steven Erikson",
    "Genero": "Fantasía",
    "año": "2008"
  }
  {
    "ISBN": "9780765310097",
    "titulo": "Dust of Dreams",
    "nombreAutor": "Steven Erikson",
    "Genero": "Fantasía",
    "año": "2009"
  }
  {
    "ISBN": "9780765310103",
    "titulo": "The Crippled God",
    "nombreAutor": "Steven Erikson",
    "Genero": "Fantasía",
    "año": "2011"
  }
~~~

actualizar 
~~~mongo
{ "año": { "$eq": "2010" } }
{
  $set: {
"Genero":"fantasia epica"
  },
}

{ titulo: { $eq: 'Mistborn: The Final Empire' } }
{
  $set: {
"titulo":"el imperio final"
  },
}

{ nombreAutor: { $ne: 'Brandon Sanderson' } }
{
  $set: {
"nombreAutor":"Steven Erikson & Ian C. Esslemont"
  },
}

[{
  "_id": {
    "$oid": "671d1069a0837e82b07a8900"
  },
  "ISBN": "9780765311788",
  "titulo": "Elantris",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2005"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8901"
  },
  "ISBN": "9780765360038",
  "titulo": "el imperio final",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2006"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8902"
  },
  "ISBN": "9780765316882",
  "titulo": "The Well of Ascension",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2007"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8903"
  },
  "ISBN": "9780765316899",
  "titulo": "The Hero of Ages",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2008"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8904"
  },
  "ISBN": "9780765326355",
  "titulo": "Warbreaker",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2009"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8905"
  },
  "ISBN": "9780765326356",
  "titulo": "The Way of Kings",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "fantasia epica",
  "año": "2010"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8906"
  },
  "ISBN": "9780765326370",
  "titulo": "Words of Radiance",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2014"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8907"
  },
  "ISBN": "9780765326387",
  "titulo": "Oathbringer",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2017"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8908"
  },
  "ISBN": "9780765399834",
  "titulo": "Rhythm of War",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2020"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8909"
  },
  "ISBN": "9780765310011",
  "titulo": "The Alloy of Law",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2011"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890a"
  },
  "ISBN": "9780765314330",
  "titulo": "Gardens of the Moon",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "1999"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890b"
  },
  "ISBN": "9780765310028",
  "titulo": "Deadhouse Gates",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2000"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890c"
  },
  "ISBN": "9780765310035",
  "titulo": "Memories of Ice",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2001"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890d"
  },
  "ISBN": "9780765310042",
  "titulo": "House of Chains",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2002"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890e"
  },
  "ISBN": "9780765310059",
  "titulo": "Midnight Tides",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2004"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890f"
  },
  "ISBN": "9780765310066",
  "titulo": "The Bonehunters",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2006"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8910"
  },
  "ISBN": "9780765310073",
  "titulo": "Reaper's Gale",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2007"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8911"
  },
  "ISBN": "9780765310080",
  "titulo": "Toll the Hounds",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2008"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8912"
  },
  "ISBN": "9780765310097",
  "titulo": "Dust of Dreams",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2009"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8913"
  },
  "ISBN": "9780765310103",
  "titulo": "The Crippled God",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2011"
}]

~~~
consultas
~~~mongo
{ "año": { "$eq": "2000" } }
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890b"
  },
  "ISBN": "9780765310028",
  "titulo": "Deadhouse Gates",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2000"
}
~~~

~~~mongo
{ "año": { "$gt": "2015" } }

{
  "_id": {
    "$oid": "671d1069a0837e82b07a8907"
  },
  "ISBN": "9780765326387",
  "titulo": "Oathbringer",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2017"
}
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8908"
  },
  "ISBN": "9780765399834",
  "titulo": "Rhythm of War",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2020"
}
~~~

~~~mongo
{ "año": { "$gte": "2011" } }
[{
  "ISBN": "9780765326370",
  "titulo": "Words of Radiance",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2014"
},
{
  "ISBN": "9780765326387",
  "titulo": "Oathbringer",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2017"
},
{
  "ISBN": "9780765399834",
  "titulo": "Rhythm of War",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2020"
},
{
  "ISBN": "9780765310011",
  "titulo": "The Alloy of Law",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2011"
},
{
  "ISBN": "9780765310103",
  "titulo": "The Crippled God",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2011"
}]
~~~

~~~
{ "titulo": { "$in": ["Elantris", "Warbreaker"] } }
[{
  "_id": {
    "$oid": "671d1069a0837e82b07a8900"
  },
  "ISBN": "9780765311788",
  "titulo": "Elantris",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2005"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8904"
  },
  "ISBN": "9780765326355",
  "titulo": "Warbreaker",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2009"
}]
~~~

~~~
{ "año": { "$lt": "2005" } }
[{
  "_id": {
    "$oid": "671d1069a0837e82b07a890a"
  },
  "ISBN": "9780765314330",
  "titulo": "Gardens of the Moon",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "1999"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890b"
  },
  "ISBN": "9780765310028",
  "titulo": "Deadhouse Gates",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2000"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890c"
  },
  "ISBN": "9780765310035",
  "titulo": "Memories of Ice",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2001"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890d"
  },
  "ISBN": "9780765310042",
  "titulo": "House of Chains",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2002"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890e"
  },
  "ISBN": "9780765310059",
  "titulo": "Midnight Tides",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2004"
}]

~~~

~~~
{ "año": { "$lte": "2010" } }
[{
  "_id": {
    "$oid": "671d1069a0837e82b07a8900"
  },
  "ISBN": "9780765311788",
  "titulo": "Elantris",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2005"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8901"
  },
  "ISBN": "9780765360038",
  "titulo": "el imperio final",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2006"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8902"
  },
  "ISBN": "9780765316882",
  "titulo": "The Well of Ascension",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2007"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8903"
  },
  "ISBN": "9780765316899",
  "titulo": "The Hero of Ages",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2008"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8904"
  },
  "ISBN": "9780765326355",
  "titulo": "Warbreaker",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2009"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8905"
  },
  "ISBN": "9780765326356",
  "titulo": "The Way of Kings",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "fantasia epica",
  "año": "2010"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890a"
  },
  "ISBN": "9780765314330",
  "titulo": "Gardens of the Moon",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "1999"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890b"
  },
  "ISBN": "9780765310028",
  "titulo": "Deadhouse Gates",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2000"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890c"
  },
  "ISBN": "9780765310035",
  "titulo": "Memories of Ice",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2001"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890d"
  },
  "ISBN": "9780765310042",
  "titulo": "House of Chains",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2002"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890e"
  },
  "ISBN": "9780765310059",
  "titulo": "Midnight Tides",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2004"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890f"
  },
  "ISBN": "9780765310066",
  "titulo": "The Bonehunters",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2006"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8910"
  },
  "ISBN": "9780765310073",
  "titulo": "Reaper's Gale",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2007"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8911"
  },
  "ISBN": "9780765310080",
  "titulo": "Toll the Hounds",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2008"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8912"
  },
  "ISBN": "9780765310097",
  "titulo": "Dust of Dreams",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2009"
}]

~~~

~~~
{ "Genero": { "$ne": "Fantasía" } }
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8905"
  },
  "ISBN": "9780765326356",
  "titulo": "The Way of Kings",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "fantasia epica",
  "año": "2010"
}
~~~

~~~
{ "$and": [{ "nombreAutor": "Brandon Sanderson" }, { "año": { "$gt": "2008" } }] }
[{
  "_id": {
    "$oid": "671d1069a0837e82b07a8904"
  },
  "ISBN": "9780765326355",
  "titulo": "Warbreaker",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2009"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8905"
  },
  "ISBN": "9780765326356",
  "titulo": "The Way of Kings",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "fantasia epica",
  "año": "2010"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8906"
  },
  "ISBN": "9780765326370",
  "titulo": "Words of Radiance",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2014"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8907"
  },
  "ISBN": "9780765326387",
  "titulo": "Oathbringer",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2017"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8908"
  },
  "ISBN": "9780765399834",
  "titulo": "Rhythm of War",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2020"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8909"
  },
  "ISBN": "9780765310011",
  "titulo": "The Alloy of Law",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2011"
}]

~~~

~~~
{ "$or": [{ "año": "2008" }, { "nombreAutor": "Steven Erikson" }] }
[{
  "_id": {
    "$oid": "671d1069a0837e82b07a8903"
  },
  "ISBN": "9780765316899",
  "titulo": "The Hero of Ages",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2008"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8911"
  },
  "ISBN": "9780765310080",
  "titulo": "Toll the Hounds",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2008"
}]
~~~

~~~
{ "año": { "$not": { "$eq": "2007" } } }
[{
  "_id": {
    "$oid": "671d1069a0837e82b07a8900"
  },
  "ISBN": "9780765311788",
  "titulo": "Elantris",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2005"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8901"
  },
  "ISBN": "9780765360038",
  "titulo": "el imperio final",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2006"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8903"
  },
  "ISBN": "9780765316899",
  "titulo": "The Hero of Ages",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2008"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8904"
  },
  "ISBN": "9780765326355",
  "titulo": "Warbreaker",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2009"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8905"
  },
  "ISBN": "9780765326356",
  "titulo": "The Way of Kings",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "fantasia epica",
  "año": "2010"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8906"
  },
  "ISBN": "9780765326370",
  "titulo": "Words of Radiance",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2014"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8907"
  },
  "ISBN": "9780765326387",
  "titulo": "Oathbringer",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2017"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8908"
  },
  "ISBN": "9780765399834",
  "titulo": "Rhythm of War",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2020"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8909"
  },
  "ISBN": "9780765310011",
  "titulo": "The Alloy of Law",
  "nombreAutor": "Brandon Sanderson",
  "Genero": "Fantasía",
  "año": "2011"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890a"
  },
  "ISBN": "9780765314330",
  "titulo": "Gardens of the Moon",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "1999"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890b"
  },
  "ISBN": "9780765310028",
  "titulo": "Deadhouse Gates",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2000"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890c"
  },
  "ISBN": "9780765310035",
  "titulo": "Memories of Ice",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2001"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890d"
  },
  "ISBN": "9780765310042",
  "titulo": "House of Chains",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2002"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890e"
  },
  "ISBN": "9780765310059",
  "titulo": "Midnight Tides",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2004"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a890f"
  },
  "ISBN": "9780765310066",
  "titulo": "The Bonehunters",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2006"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8911"
  },
  "ISBN": "9780765310080",
  "titulo": "Toll the Hounds",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2008"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8912"
  },
  "ISBN": "9780765310097",
  "titulo": "Dust of Dreams",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2009"
},
{
  "_id": {
    "$oid": "671d1069a0837e82b07a8913"
  },
  "ISBN": "9780765310103",
  "titulo": "The Crippled God",
  "nombreAutor": "Steven Erikson & Ian C. Esslemont",
  "Genero": "Fantasía",
  "año": "2011"
}]
~~~

