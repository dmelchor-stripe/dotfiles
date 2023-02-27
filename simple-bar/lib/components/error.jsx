import * as Utils from "../utils";

const message = {
  error: "Something went wrong...",
  yabaiError: "yabai is not running",
  noOutput: "Loading...",
  noData: "JSON error...",
};

export const Component = ({ type, classes }) => {
  const errorClasses = Utils.classnames("simple-bar--empty", classes, {
    "simple-bar--loading": type === "noOutput",
  });

  if (type === "error" || type === "noData") {
    setTimeout(Utils.softRefresh, 2000);
  }

  if (type === "yabaiError") {
    setTimeout(Utils.softRefresh, 15000);
  }

  return (
    <div className={errorClasses}>
      <span>simple-bar-index.jsx: {message[type]}</span>
    </div>
  );
};
