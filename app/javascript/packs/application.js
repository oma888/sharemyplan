import "bootstrap";
// import Swal from 'sweetalert2'
import { categoryClicker } from "./plugins/add";
import { changePlace } from "./plugins/change";
import { someChange } from "./plugins/subscriptionIndex";
// import { stickyNavigation } from "./plugins/navbar";
import { createNotification } from "./plugins/notification";

import { ecritureHome } from "./plugins/bannerHome";


import { initSweetalert } from './plugins/init_sweetalert';

// import { someDelete } from './plugins/sweetalert2';

import { openModal } from './plugins/openModal';
import { dynamicRating } from './plugins/starsRating';



categoryClicker();
changePlace();
someChange();
// stickyNavigation();
createNotification();
ecritureHome();




initSweetalert('#button-cotisation-cancel', {
  title: "Voulez- vous vraiment abandonner votre achat ?",
  text: "Précisez votre choix",
  icon: "warning",
  buttons: {
    cancel: "Reprendre où vous en étiez",
    confirm: { text: "Confirmer l'abandon", value: true },
    },
  }, (value) => {
    if (value) {
      const link = document.getElementById('cancel-cotisation-link');
      link.click();
    }
   });



initSweetalert('#share-quit', {
  title: "Souhaitez-vous vraiment vous retirer de cet abonnement ?",
  text: "Précisez votre choix",
  icon: "warning",
  buttons: {
    cancel: "Rester dans le share ",
    confirm: { text: "Confirmer l'abandon", value: true },
    },
  }, (value) => {
    if (value) {
      const link2 = document.getElementById('share-quit-link');
      link2.click();
    }
   });

initSweetalert('#subscription-stop', {
  title: "Souhaitez-vous vraiment supprimer cet abonnement ?",
  text: "Précisez votre choix",
  icon: "warning",
  buttons: {
    cancel: "Continuer de partager ",
    confirm: { text: "Confirmer l'arrêt", value: true },
    },
  }, (value) => {
    if (value) {
      const link = document.getElementById('subscription-stop-link');
      link.click();
    }
   });

initSweetalert('#fire-co-abonne', {
  title: "Souhaitez-vous vraiment exclure cet utilisateur de votre abonnement?",
  text: "Précisez votre choix",
  icon: "warning",
  buttons: {
    cancel: "Non, le garder",
    confirm: { text: "Oui, l'exclure", value: true },
    },
  }, (value) => {
    if (value) {
      const link = document.getElementById('fire-co-abonne-link');
      link.click();
    }
   });

openModal();
dynamicRating();


