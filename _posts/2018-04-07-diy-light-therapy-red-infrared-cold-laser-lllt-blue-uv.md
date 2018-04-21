---
layout: post
title: "DIY Light Therapy (Red/Near Infrared, Cold/Low Level Laser, Blue/UV, etc)"
tags:
- linkdump
- biohacking
- wellness
- research
- diy
- light-hacking
- joovv
- redjuvenator
- redlight
- infrared
- nir
- laser
- lllt
- cystic-fibrosis
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: true
---
I tend to dive down rabbit holes a lot, and given the cost of context switching and memory deteriorating over time, sometimes the state I build up in my mind gets lost between the chances I get to dive in. These 'linkdump' posts are an attempt to collate at least some of that state in a way that I can hopefully restore to my brain at a later point.

This time around I was inspired to look into Red/Infrared light therapy, originally motivated by some Bulletproof blog posts/talk ([1](https://blog.bulletproof.com/health-benefits-red-light-therapy/), [2](https://blog.bulletproof.com/light-hacking-for-better-energy-mood-and-performance/), [etc](https://blog.bulletproof.com/tag/light-hacking/)), and the cost of the [Joovv](https://joovv.com/products/joovv-light?variant=39356431502) light panels. Let's dig in!

## Joovv

[Joovv](https://joovv.com/) is one of those hip health/wellness brands making red/infrared light therapy devices. They tout all of the good buzzwords like low/free of EMF, etc, and they're working in an emerging space (light therapy) that at least at a cursory level of skimming the research sounds like it could have some really cool benefits. The downside? Popular brands and fancy marketing costs money, businesses need money to survive, and so for the [Joovv Mini](https://joovv.com/products/joovv-light?variant=39356431502) we're looking at about ~US$600. Too expensive for my tastes, particularly for what appears to just be an array of LEDs.

Now, being a builder/breaker type, with a growing interest in the hardware/maker side.. I decided to look into it a little and figure if I could build my own. For reasons, for science!

So looking at the [Joovv Mini](https://joovv.com/products/joovv-light?variant=39356431502), we can infer the following:

* There are 2 grids of LEDs, each consisting of a 6x5 array of LEDs, for a total of 30 LEDs per grid, or 60 in the entire Joov Mini
* If you get the mixed Red/Infra Red panels, you end up with: 14 red (660nm), 16 near infrared (850nm) per grid (28 red, 32 near infrared total)
* Power consumption is 120w, so divided by the total LEDs (60), they seem to be 2w LEDs
* There are 2 cooling fans, so that is probably 1 per grid
* Total dimensions are: 15" x 8.25" x 3"
* Irradiance/treatment area are listed as: >100+mw/cm^2, 25" x 18" (these will vary based on wavelength, distance used, etc)

The other models just appear to use different counts of the 'LED grid', and include:

* [Joovv Mini](https://joovv.com/products/joovv-light?variant=39356431502): 2 grids, 60 LEDs, 2 fans, 120w, ~US$595 (or ~US$9.91/LED)
* [Joovv Original](https://joovv.com/products/joovv-light?variant=39356431694): 5 grids, 150 LEDs, 5 fans, 300w, ~US$995 (or ~US$6.6/LED)
* [Joovv Max](https://joovv.com/products/joovv-light?variant=39356431886): 16 grids, 480 LEDs, 16 fans, 960w, ~US$2695 (or ~US$5.6/LED)

So this gives us some pretty good starting parameters from a 'best of breed' product, to use as a basis when we go digging around elsewhere. It also goes to show that there is probably a decent bit of margin between hardware costs and final product (as there always is), so DIY savings abound! We want:

* A bunch of 2w (or higher) red (660nm)/NIR (850nm) LEDs
* Some fans
* Power
* Casing, etc

## Other Commercial Products

So there are a number of other products in this space too.. just a couple off the top of my head:

* [REDjuvenator](https://catalyticcolor.com/redjuvenator-light-therapy/)
  * 15 x 15 array of LEDs (225 total), 1 foot square panel
  * Formula #1: Looks like all red LEDs
  * Formula #2: Looks like red/near infrared
  * Formula #3: Claims the benefits of #1 + #2
  * Formula #4: 'Bacteria buster', looks like red + UV LEDs
* Bulletproof Labs [REDcharger](http://bulletprooflabs.com/body/) (which is a rebranding of another device.. but I forget the name at the moment..): 630nm/880nm. I think there were like 40,000 LEDs in this.. I feel like there was some small amount of blue/UV in there as well from memory..

## Sourcing LEDs

Now I haven't done a whole lot in this hardware building space before.. but I do know that [AliExpress](https://www.aliexpress.com/) tends to have AllTheThings(tm).. I won't directly link as you may find better deals, but a few searches included:

* 660nm led
* 850nm led

Now.. I could go for the 2w spec like Joovv uses.. but maybe there are more interesting/cheaper combinations. Looking through the search results the following seemed common: 1w, 3w, 5w. Maybe we could change up the parameters for our build? For example, [one supplier](https://www.aliexpress.com/item/10pcs-1W-3W-High-Power-LED-Full-Spectrum-White-Warm-white-Green-Blue-Deep-Red-660nm/32859370682.html) listed the following (may not be the best price, or the best supplier, just one example):

* 1w, deep red (660nm): ~US$3.10/10pc == US$0.31/ea
* 3w, deep red (660nm): ~US$3.50/10pc == US$0.35/ea
* 1w, infrared (850nm): ~US$6.90/10pc == US$0.69/ea
* 3w, infrared (850nm): ~US$7.90/10pc == US$0.79/ea

So from a completely naive back of napkin cost calculation using the 3w LEDs:

* Mini: 28 red (~US$9.80), 32 NIR (~US$25.28), **Total:** ~US$35.08
* Original: 70 red (~US$24.50), 80 NIR (~US$63.20), **Total:** ~US$87.70
* Max: 224 red (~US$78.40), 256 NIR (~US$202.24), **Total:** ~US$280.64

Obviously there will be additional costs for the power supply, fans, casing, construction, etc.. but those costs seem far nicer to me.

There were also some [other providers](https://www.aliexpress.com/item/High-Power-LED-Chip-Deep-Red-LED-660nm-Plant-Grow-Light-1W-3W-5W-10W-20W/32633843531.html) that had some interesting looking LED arrays, with powers such as: 1w, 3w, 5w, 10w, 20w, 30w, 50w, 100w. So we could go super powerful if we wanted (though maybe wouldn't get as good coverage..). Also.. is there a sweet spot for the power/brightness? Need to dig into the research more for that.. It sounds like there is.

In doing some reading, it seems that a lot of the 'grow lights' actually operate in the same spectrums (good for plants, good for us!), so that may be another path worth looking into.

## But what about EMFs?

So one of the claims among a number of these products is that they're 'low/free from EMFs', and a cursory skim of some of the research sounds plausible that EMFs could be a thing worth caring about (search terms: EMF voltage regulated calcium channels, etc). Now this isn't an area I've really looked much into, but if we assume they are bad.. what can we do about it? Off the top of my head, and completely unsubstantiated, I would imagine some form of [faraday cage](https://en.wikipedia.org/wiki/Faraday_cage) type device would do the trick, given it's an "enclosure used to block electromagnetic fields". So maybe that's an area to read more into..

## But what about blue light?

So.. seems we can use blue/UV light for things too.. more related to inhibiting bad stuff it seems. Could definitely be an interesting rabbit hole to dive deeper down:

* [Blue light treatment of Pseudomonas aeruginosa: Strong bactericidal activity, synergism with antibiotics and inactivation of virulence factors](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5626244/)
  * One of the more common infection types in Cystic Fibrosis.. interesting..

There also seems to be some stuff in the space of using blue (technically violet, 360-400nm) light for myopia/similar:

* https://blog.bulletproof.com/violet-light-eye-health/
* [PubMed: Violet Light Exposure Can Be a Preventive Strategy Against Myopia Progression](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5233810/)

## Lasers!

So, moving a bit away from the LED side of things.. a lot of the 'Low Level Laser Therapy' or 'Cold Laser' treatments out there are using laser diodes instead. They can penetrate deeper, tend to be higher power, more focussed, etc. I've heard about these sorts of things being used to aid in healing of injured joints and more, enough to catch my interest. But once again, these things are expensive (a treatment might cost you $50/session).. and hard to come buy for the biohacker type who isn't a medical professional. For example:

* [THOR Laser](https://www.thorlaser.com/products/)
  * ~US$14,000-24,000
  * Various LED/laser probe options (810nm IR laser, 660nm laser, etc)
  * These ones sound quite low powered too: 30mW, 75mW, 200mW, etc
* [MR4 Super Pulsed Laser](http://multiradiance.com.au/products/mr4-super-pulsed-laser):
  * ~AU$10,000
  * Infrared (860-960nm)
  * Red (600-740nm)
  * Laser (25w, pulsed)

So looking deeper into the wavelengths, power levels, and options, we find:

* https://www.coldlasers.org/therapy/wavelength/

Skimming through some of this stuff.. it sounds like we want to look into pulsed/super pulsed laser diodes.. but what are they?

* https://www.pulselaserrelief.com.au/super-pulsed-low-level-laser-therapy

**tl;dr:** high power, low heat, deeper penetration, 904-905nm Gallium Arsenide (GaAS) diode

And if we turn to our trusty component dealer [AliExpress](https://www.aliexpress.com/), we turn up a few interesting search results:

* pulsed laser diode 25w

Now remember.. lasers are dangerous, you can and will destroy your eyes if you do bad things with them. Always wear proper laser eye safety when doing anything like this. Also, if you're in a country like Australia, they may just actually not let you import these full stop.. yay for draconian laws! There might be a way around it for 'legit reasons' (rather than annoying cats with red dots), but it's not an area I've deeply looked into yet.

Now that that's out of the way.. maybe like ~US$25 for a laser diode.. and then need to power it, probably cool it, etc. Better than $25k!

## Link Dump

Now that we've got all of that out of the way, how about that link dump:

* https://www.redlighttherapy.com.au/
* https://draxe.com/red-light-therapy/
* https://redlightman.com/blog/complete-guide-light-therapy-dosing/
* [PubMed: The Nuts and Bolts of Low-level Laser (Light) Therapy](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3288797/)
  * "The wavelengths of light used for LLLT fall into an “optical window” at red and NIR wavelengths (600–1070 nm) (Fig. 1d). Effective tissue penetration is maximized in this range, as the principal tissue chromophores (hemoglobin and melanin) have high absorption bands at wavelengths shorter than 600 nm. Wavelengths in the range 600–700 nm are used to treat superficial tissue, and longer wavelengths in the range 780–950 nm, which penetrate further, are used to treat deeper-seated tissues. Wavelengths in the range 700–770 nm have been found to have limited biochemical activity and are therefore not used."
* [PubMed: Low-level laser (light) therapy (LLLT) in skin: stimulating, healing, restoring](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4126803/)

And if we want to try sensing/reading different wavelengths (maybe for testing, or reverse engineering things, or just for fun!):

* [Arduino Forum: Sensing wavelength of lights](http://forum.arduino.cc/index.php?topic=17429.0)
* https://hackaday.com/2014/07/31/diy-usb-spectrometer-actually-works/
* https://www.photonicsonline.com/doc/wavelength-sensor-and-circuit-pss-ws-756-pcb-0001
* https://www.first-sensor.com/en/products/optical-sensors/detectors/wavelength-sensitive-diodes-ws/

Full spectrum bulbs:

* http://www.viva-lite.com.au/

Power supplies that are probably actually safe enough to plug into 240v:

* https://www.meanwell-led-drivers.com.au/

## Conclusion

So now we have a wide variety of interesting starting points, and some key words/aspects to dig deeper into this area of research/DIY building. We learned that a lot of these products, while very cool and useful, also tend to be WAY overpriced. Maybe we can build our own, open source the designs/components/learnings from it, and move everyone forward together (rather than only those who have the big $$ to benefit).

Was this useful? Have you built your own DIY light hacking devices? Got a cool story to share? Some new research? I'd love to hear what you're doing in this space in the comments below!
