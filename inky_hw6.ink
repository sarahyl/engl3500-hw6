VAR cat_num = 0
VAR raven_num = 0
VAR frog_num = 0
VAR familiar_animal = ""

You're a witch who specializes in brewing potions!

-> animals

== animals == 

= familiar
- Every witch needs a familiar. You're not really considered a full-fledged witch until you have one. What sort of familiar do you have?

* [A cat]
    -> cat
* [A raven]
    -> raven
* [A frog]
    -> frog

= cat
~ cat_num = cat_num + 1
What kind of cat?
* Black cat
* Tabby
* Siamese
- Aside from your familiar, many witches are animal-lovers who also keep pets. 
-> more_animals

= raven
~ raven_num = raven_num + 1
How tiny is your raven?
* Normal sized
    ~familiar_animal = "normal sized raven"
* Tiny 
    ~familiar_animal = "tiny raven"
* The tiniest 
    ~familiar_animal = "tiniest raven"
- Aside from your familiar, many witches are animal-lovers who also keep pets. 
-> more_animals

= frog
~ frog_num = frog_num + 1
What kind of frog?
* Bullfrog
    ~familiar_animal = "bullfrog"
* Tree frog
    ~familiar_animal = "tree frog"
- Aside from your familiar, many witches are animal-lovers who also keep pets. 
-> more_animals

= more_animals
Do you have any other animals?

+ I also have a (non-magical) cat.
    A lovely {tabby|black|siamese} cat!
    ~ cat_num = cat_num + 1
    -> more_animals
+ I also have a (non-magical) raven.
    A lovely, {!normal sized|tiny|very tiny} raven!
    ~ raven_num = raven_num + 1
    -> more_animals
+ I also have a (non-magical) frog.
    A lovely {&bullfrog|tree frog}!
    ~ frog_num = frog_num + 1
    -> more_animals
* No, that's all.
    Just you and your <>
    {
    - cat_num==0: nonexistant cat
    - cat_num==1: cat
    - else:
        {cat_num} cats
    }
    <> and your <> 
    {
    - raven_num==0: nonexistant raven
    - raven_num==1: raven
    - else:
        {raven_num} ravens
    }
    <> and your <> 
    {
    - frog_num==0: nonexistant frog
    - frog_num==1: frog.
    - else:
        {frog_num} frogs.
    }
    -> customization

== customization ==
= clothes
Fashion is very important to witches. What is your signature look?

* All black from head to toe, and everything is sparkly, like the night sky. Blinding to the eye. Like a disco ball.
* Hot pink witch's hat decorated with giant daisies. Hot pink robes to match, with the biggest, flowiest sleeves you've ever seen.
* {animals.cat} Cat pajamas!
* {animals.raven} Raven pajamas!
* {animals.frog} Frog pajamas!

- Looking good!
->familiar_outfit

= familiar_outfit
Does your familiar have a matching accessory?
* Of course. 
* That's beneath their dignity.
* {cat_num + raven_num + frog_num > 1} All of my animals have little accessories. 
-
-> story

== story ==
Usually your {familiar_animal} familiar greets you in the mornings when you first wake up, but today they're nowhere to be found. 
-> missing_familiar

= missing_familiar
* You call out their name to see if they'll respond.
    You wait for some seconds, but you don't see them anywhere.
    -> missing_familiar
* You decide to make breakfast - they'll show up in their own time.
    You take your time in the kitchen, but by the time you washed and put away your dishes, they still haven't made an appearance.
    -> missing_familiar
* -> look_for_them

= look_for_them
You look around your small, but admittedly cluttered house and wonder where they could possibly be. 

* You check their favorite window sill [] but you don't see them perched there.
    -> look_for_them
* You check your collection of plants in the corner of your living room[], which they sometimes like to hang out with, but your familiar is nowhere to be seen.
    -> look_for_them
* -> sick_familiar
    
= sick_familiar
You finally decide to check if they're still sleeping.

There they are! Still in bed, long past their usual waking time. They're usually bopping around the house by now.

After a quick check, it becomes apparent that they'll fallen ill during the night. Oh dear. After setting out some food and water for them, you decide to put aside whatever plans you had for the day and set out to make a healing potion that'll speed up their recovery.



-> END