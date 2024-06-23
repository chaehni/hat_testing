if obj.metadata.annotations ~= nil then
    if obj.metadata.annotations.key == "value" then
        hs = {}
        hs.status = "Progressing"
        hs.message = ""
        if obj.status ~= nil then
            if obj.status.health ~= nil then
                hs.status = obj.status.health.status
                if obj.status.health.message ~= nil then
                    hs.message = obj.status.health.message
                end
            end
        end
        return hs
    end
end
