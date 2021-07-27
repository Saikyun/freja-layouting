(import ../freja-layout/jaylib-tags :as jt)
(import ../freja-layout/hiccup2 :as h)
(import freja/events :as e)
(use freja/defonce)
(use jaylib)

(import ../freja-layout/assets :as a)
(a/register-default-fonts)

(use profiling/profile)

(setdyn :pretty-format "%.40M")

(defonce my-props @{})


(defn hiccup
  [props & children]
  [:padding {:top 30
             :left 600}
   #[:block {}
   [:background {:color 0x00ff00ff}
    [:flow {}
     "hej"
     [:background {:color :red}
      [:flow {} "lul2"]]
     "lul"]]]
  #]
)

## TODO: set row height too in definite

(defn list123
  [props & _]

  [:block {}
   ;(seq [_ :range [0 100]]
      [:row {}
       [:background {:weight nil :color :blue}
        [:padding {:all 10}
         [:clickable {:on-click |(do (pp $)
                                   (e/put! (props :p) :a 10))}
          [:block {} "Open"]]]]
       [:background {:weight 1 :color :green}
        [:block {:weight 1}
         [:background {:color :orange}
          [:align {:horizontal :right}
           "Ctrl+O"]]]]])])


(defn hiccup
  [props & children]
  [:padding {:left 600 :top 30}
   #"hej"
   #[:block {}]

   [:background {:color :green}
    [:shrink {}
     [:row {}
      [:block {:weight 1}
       "a"]
      [:block {:width 100}
       "b"]]]]
   [:block {}]
   [:shrink {}
    [:row {}
     [:background {:weight nil :color :pink}
      [:padding {:all 10}
       [:clickable {:on-click |(do (pp $)
                                 (e/put! props :a 10))}
        [:block {} "Open"]]]]

     [:background {:weight 1 :color :orange}
      [:block {}
       [:align {:horizontal :right}
        "Ctrl+OOOxdO"]]]]
    [:row {}
     [:background {:weight nil :color :pink}
      [:padding {:all 10}
       [:clickable {:on-click |(do (pp $)
                                 (e/put! props :a 10))}
        [:block {} "Open"]]]]

     [:background {:weight 1 :color :orange}
      [:block {}
       [:align {:horizontal :right}
        "Ctrl+O"]]]]]

   [:block {}]

   [:background {:color :red}

    [:block {}
     [:row {}
      [:background {:weight nil :color :pink}
       [:padding {:all 10}
        [:clickable {:on-click |(do (pp $)
                                  (e/put! props :a 10))}
         [:block {} "Open YEAH"]]]]

      [:background {:weight 1 :color :orange}
       [:block {}
        [:align {:horizontal :right}
         "Ctrl"]]]]

     [list123 {:p props}]]]])


(comment
  (import ./compile-hiccup :as ch :fresh true)
  (import ./sizing/definite :as ds :fresh true)
  (import ./sizing/relative :as rs :fresh true)

  (let [el (ch/compile [hiccup my-props]
                       :tags jt/tags)
        el (ds/set-definite-sizes el 800 600)
        el (rs/set-relative-size el 800 600)]
    (ch/print-tree el))
  #
)

#(comment
(def c (h/new-layer :test-layer2
                    hiccup
                    my-props
                    :render jt/render
                    :tags jt/tags
                    :text/font "Poppins"
                    :text/size 24
                    :max-width (get-screen-width)
                    :max-height 600))
#)

