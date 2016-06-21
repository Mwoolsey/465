topics = Topic.create(
  [
    { title: 'Gaming', description: 'Here is where you can find gaming info' },
    { title: 'Horses', description: 'Horses are nice and so are references' },
    { title: 'Programming', description: 'It is good to keep programming references' },
    { title: 'Cleaning', description: 'Lots of different advice on cleaning' },
    { title: 'Welding', description: 'Did it for so long and now I dont have the time' }
  ]
)

references = Reference.create(
  [
    { URL: 'https://steamcommunity.com/', topic_id: topics[0].id },
    { URL: 'http://ark.gamepedia.com/ARK_Survival_Evolved_Wiki', topic_id: topics[0].id },
    { URL: 'http://www.ign.com/', topic_id: topics[0].id },
    { URL: 'http://www.learn-about-horses.com/', topic_id: topics[1].id },
    { URL: 'https://www.codecademy.com/', topic_id: topics[2].id },
    { URL: 'https://www.hackerrank.com/', topic_id: topics[2].id },
    { URL: 'https://www.lynda.com/', topic_id: topics[2].id },
    { URL: 'https://www.tryupkeep.com/', topic_id: topics[3].id },
    { URL: 'http://www.organizedhome.com/', topic_id: topics[3].id },
    { URL: 'http://www.mjbwelding.com/', topic_id: topics[4].id },
    { URL: 'http://www.harborfreight.com/welding.html', topic_id: topics[4].id },
    { URL: 'http://www.aws.org/', topic_id: topics[4].id }
  ]
)
