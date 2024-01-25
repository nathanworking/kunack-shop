import { animate, inView, stagger, ScrollOffset } from "motion";

inView(".ani_title_default_container", ({ target }) => {
     amount: 1;
     animate(
          target.querySelectorAll('.ani_default_element_title'),
          { 
               opacity: [0,1],
          },
          {
               delay: stagger(0.5),
               duration: 0.8,
               easing: [0.17, 0.55, 0.55, 1]
          }
     );
   });
inView(".ani_content_default_container", ({ target }) => {
     animate(
          target.querySelectorAll('.ani_default_element_content'),
          { 
               opacity: [0,1],
               transform: ["translateY(5rem)", "translateY(0)"]
          },
          {
               delay: stagger(0.2),
               duration: 0.6,
               easing: [0.17, 0.55, 0.55, 1]
          }
     );
   });

//    const carousel = document.querySelector("#carousel")

//    inView("#carousel li", callback, { root: carousel })
// import { inView, animate } from "motion";

// inView("section", ({ target }) => {
//   animate(
//     target.querySelector("span"),
//     { opacity: 1, transform: "none" },
//     { delay: 0.2, duration: 0.9, easing: [0.17, 0.55, 0.55, 1] }
//   );
// });
  