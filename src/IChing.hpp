// Default empty project template
#ifndef IChing_HPP_
#define IChing_HPP_

#include <QObject>

namespace bb { namespace cascades { class Application; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class IChing : public QObject
{
    Q_OBJECT
public:
    IChing(bb::cascades::Application *app);
    virtual ~IChing() {}
};


#endif /* IChing_HPP_ */
