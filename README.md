<img alt="# scryfall_rb" src="./assets/scryfall_rb.png" width="50%">

scryfall_rb is an open source Ruby client library for [Scryfall's](https://scryfall.com/) [API](https://scryfall.com/docs/api) 

Features
--------

* Card lookup with Scryfall's fulltext query.
* Full catalog support for cards, artists, and types
* Set details by name (set code) or id
* Extensible error handling with Scryfall specific details

Future Features
---------------
* Card image querying with options for downloading to local filesystem.
* `.next()` for lists with a none-null `has-next` value.
* Improved support for fulltext queries, including argument parsing. Currently, oracle text must be split by whitespace (ie. `"oracle:draw oracle:a oracle:card" => "oracle%3Adraw%20oracle%3Aa%20oracle%3Acard"`. That process can be further simplified.

Stretch Features
----------------
* OAuth for 3rd party applications. Currently this feature is in a closed beta and registration is closed to the general public. This feature will be tackles once OAuth support goes GA

All class/method names follow Scryfall's own naming convention, so their [API documenation](https://scryfall.com/docs/api) is the base place to look if you have any questions.

Examples
--------

All `card` fields returned by Scryfall are packed into the `Scryfall::Card` object (including all image URI's for download).
```
card = Scryfall::Card.random

card.class
=> Scryfall::Card

card.inspect
=> "#<Scryfall::Card:0x00005624429b77f8 @attributes=#<OpenStruct object=\"card\", id=\"442b8c31-f346-4984-9159-2dce6a7485ac\", oracle_id=\"d0f06250-25a5-4003-8f3a-6d85ef32ea10\", name=\"Keening Stone\", lang=\"en\", released_at=\"2016-11-11\", mana_cost=\"{6}\", cmc=6.0, type_line=\"Artifact\", oracle_text=\"{5}, {T}: Target player puts the top X cards of their library...

```

Full text queries are done in plain text -- no need to [properly encoding](https://en.wikipedia.org/wiki/Percent-encoding) the query strings. For large query results, pagination is supported. Users are left to request 'next_page' values as needed.

```
cards = Scryfall::Card.search("type:sorcery color:U")

cards.class
=> Scryfall::List

cards.total_cards
=> 422

cards.next_page
=> "https://api.scryfall.com/cards/search?format=json&include_extras=false&include_multilingual=false&order=name&page=2&q=type%3Asorcery+color%3Au&unique=cards"
```


License
-------
The scryfall_rb client is available under the terms of the MIT License.

Use of Scryfall/WoTC Data
--------------------

As per [Scryfall's own documentation](https://scryfall.com/docs/api), Scryfall provides their card data and image database free of charge for the primary purpose of creating additional Magic software, performing research, or creating community content (such as videos, set reviews, etc) about Magic and related products as part of the Wizards of the Coast Fan Content Policy,.

When using Scryfall data, you must adhere to the following guidelines:

 * You may not use Scryfall logos or use the Scryfall name in a way that implies Scryfall has endorsed you, your work, or your product.
 * You may not require anyone to make payments, take surveys, agree to subscriptions, rate your content, or create accounts in exchange for access to Scryfall data.
 * You may not use Scryfall data to create new games, or to imply the information and images are from any other game besides Magic: The Gathering.
 
 This software is not produced, endorsed, or supported by Wizards of the Coast or Scryfall.
