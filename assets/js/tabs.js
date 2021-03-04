const tabs = document.querySelectorAll('.tabs a');
const panels = document.querySelectorAll('.tab-panel');

tabs.forEach((tab) => {
    tab.addEventListener('click', function(e){
        e.preventDefault();
        const currentTab = document.querySelector('.tabs a.current');
        const currentPanel = document.querySelector('.tab-panel.current');
        const newPanel = document.getElementById(this.getAttribute('href'));
        currentTab.classList.remove('current');
        currentPanel.classList.remove('current');
        this.classList.add('current');
        newPanel.classList.add('current');
    });
});