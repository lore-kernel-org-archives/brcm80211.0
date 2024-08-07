Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CD982C8E
	for <brcm80211@lists.linux.dev>; Wed,  7 Aug 2024 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723049311; cv=none; b=nGdSOgtIHFEWlKj9Yd8a9WvnEPEXXe1WOBTepoTafqg+nYimBNzmGDyO5uuNxY1zqBz8E0dyzEoOFWdV8GBn5P8mfh4aMSmfsBJRhmLhsTwtBICj94AE9L+VrXgFm0MauQa9MsPQbEBd9TT3P75AIiqQur8fxifAgX4kHBroMBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723049311; c=relaxed/simple;
	bh=MyGpS8A8yCOgOMFPJGm3nQghuITkLQxuSG1wKxyoEAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHynt1jI4wJTtDUMslmeCfm4rdsfxurvrjPyppnXWU7ucMrO4r7qUr4TTS8+EIgPY20/kLVvwG4IgEmXsyLZs06r78ajHwC+UYDT1A9bHLWi9Rwmwti6ZWsmwIW2uthuKRSvDuZaLtMAy+qmly/YTznOcVrp360P/KV9H0du1ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3w1COrm; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3w1COrm"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a1d3959ad5so6241485a.0
        for <brcm80211@lists.linux.dev>; Wed, 07 Aug 2024 09:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723049309; x=1723654109; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ppEzbuljpxEqS9CSU1lR4GhsTWn9NP9h9n5p+ezkHKg=;
        b=e3w1COrmlHbWXm/S5rZIs1bxLfdxvYyy9NQmpfP2Y9ikSz40iTVN0A96Z6VGevFptY
         pJ6gUBV3SAktdssB7nbjcWFJ5DMs78as0evVGJcbam/U+Z11+st87bu7dMWhfGtvLtrT
         J6jYoySE3/yvIGHevsHumSJ/cwQMr2BDVGAF+QyAW3OsRBPbHniDQ/PvLL+1G94cYzGj
         7Q2Zv7iwgXB0YxmCjsdtKvvmPb+4EaUmLtxEM890fvwEjAUpLipWPDbW4fnV8WdQLh4v
         7Y3kCR5ZqBpw1qg3C+5wMQ71PDmvzBFqLuA8XFC8yL0XK3R3AOJnjSno81LP4GLsWYYl
         gztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723049309; x=1723654109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppEzbuljpxEqS9CSU1lR4GhsTWn9NP9h9n5p+ezkHKg=;
        b=VmMj2i/qQQWFqzeozRULUnAtLEf63SYajeT3RCblxePd47qaAd/eap8zNeDCcZmahH
         RRehjytnNOGas0ubOH5dM3yXEq7KX0av9mvONEb7mBU7sNxOCU0rQrDAsp6mwr+BHSlr
         U8nXl0+mqhXMPBKPY5mjH2rgmGuSSbqeiAr6nQZevZ4a5bSmb6XqPSSphzikYezjth3k
         NadMeJY4AYBB6iZs1PAHTL16q0WMnM/TsGb131JZDrmUXHKh7oPmcva0mjd5byjjjZtV
         zMomxh5o3paisc3DdSMg7d187mHYp8kqNlN1TkrjllxfJMC4FpmVQLVf9TnHgHUXeZjl
         zNxA==
X-Forwarded-Encrypted: i=1; AJvYcCUdoomAd6Uy4/WQy3sgSkzIDnpg2GaCMLqmHXXSXPMlZDtl+D6JgLDRtl/DFIOMOSKf0qSAwFPXjgGiIcGjbr4uyDAtNhkOVzrv
X-Gm-Message-State: AOJu0Yx33WxgNv0R7WO9SlrhO6Z1BRUcJZXp8cs5UGMYnKmVtlbXwULC
	yam1+CAJcbOAutx8h+ClhvaFVLHYnF3/K3Id3AwMA297mqIMkNMcYTwwNIufAukz2Mhh5YnxUxi
	/kKLVfVJSnOzvJivBqdOx/1P89mQ=
X-Google-Smtp-Source: AGHT+IGrz1woRCdFcf3AU1cz6WnokARNZ8npr64xqniUVjK159lEQjZ0EsGdSQw2I8QF6WpZIMde7xJ4DnI207ISe+Y=
X-Received: by 2002:a05:620a:2484:b0:7a1:dc64:59db with SMTP id
 af79cd13be357-7a377ba35c1mr531954785a.8.1723049308726; Wed, 07 Aug 2024
 09:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240805073425.3492078-1-jacobe.zang@wesion.com>
 <20240805073425.3492078-5-jacobe.zang@wesion.com> <2e38c2bd-2cb2-4104-97ad-0355069606c0@gmail.com>
 <b6551bf0-2ee9-4b79-af68-0677e3f0f915@broadcom.com>
In-Reply-To: <b6551bf0-2ee9-4b79-af68-0677e3f0f915@broadcom.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 7 Aug 2024 19:48:17 +0300
Message-ID: <CABjd4YzEzDW6KhTJ1ZBU1PptHotgDqg8i03Z7VAfdzAgQo8BDw@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] wifi: brcmfmac: Add optional lpo clock enable support
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Jacobe Zang <jacobe.zang@wesion.com>, 
	robh@kernel.org, krzk+dt@kernel.org, heiko@sntech.de, kvalo@kernel.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	conor+dt@kernel.org
Cc: efectn@protonmail.com, dsimic@manjaro.org, jagan@edgeble.ai, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	arend@broadcom.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	megi@xff.cz, duoming@zju.edu.cn, bhelgaas@google.com, minipli@grsecurity.net, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	nick@khadas.com
Content-Type: text/plain; charset="UTF-8"

On 07/08/2024 2:17 pm, Arend van Spriel wrote:
> On 8/7/2024 1:10 AM, Alexey Charkov wrote:
>> Hi Jacobe,
>>
>> On 05/08/2024 10:34 am, Jacobe Zang wrote:
>>> WiFi modules often require 32kHz clock to function. Add support to
>>> enable the clock to PCIe driver and move "brcm,bcm4329-fmac" check
>>> to the top of brcmf_of_probe. Change function prototypes from void
>>> to int and add appropriate errno's for return values that will be
>>> send to bus when error occurred.
>>>
>>> Co-developed-by: Ondrej Jirman <megi@xff.cz>
>>> Signed-off-by: Ondrej Jirman <megi@xff.cz>
>>> Co-developed-by: Arend van Spriel <arend.vanspriel@broadcom.com>
>>> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
>>> Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
>>> ---
>>>   .../broadcom/brcm80211/brcmfmac/bcmsdh.c      |  4 +++
>>>   .../broadcom/brcm80211/brcmfmac/common.c      |  6 +++-
>>>   .../wireless/broadcom/brcm80211/brcmfmac/of.c | 28 +++++++++++++------
>>>   .../wireless/broadcom/brcm80211/brcmfmac/of.h |  9 +++---
>>>   .../broadcom/brcm80211/brcmfmac/pcie.c        |  3 ++
>>>   .../broadcom/brcm80211/brcmfmac/sdio.c        | 18 ++++++++----
>>>   .../broadcom/brcm80211/brcmfmac/usb.c         |  3 ++
>>>   7 files changed, 52 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/
>>> bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
>>> index 13391c2d82aae..ee3ca85c4a47b 100644
>>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
>>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
>>> @@ -951,6 +951,10 @@ int brcmf_sdiod_probe(struct brcmf_sdio_dev
>>> *sdiodev)
>>>           ret = -ENODEV;
>>>           goto out;
>>>       }
>>> +    if (IS_ERR(sdiodev->bus)) {
>>> +        ret = PTR_ERR(sdiodev->bus);
>>> +        goto out;
>>> +    }
>>
>> Maybe return -ENODEV error pointer instead of NULL from
>> brcmf_sdio_probe as the default for the fail path? Then you can
>> condense these two checks into one
>
> Sound reasonable.
>
>>>       brcmf_sdiod_host_fixup(sdiodev->func2->card->host);
>>>   out:
>>>       if (ret)
>>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/
>>> common.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
>>> index b24faae35873d..6c5d26f9b7661 100644
>>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
>>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
>>> @@ -561,8 +561,12 @@ struct brcmf_mp_device
>>> *brcmf_get_module_param(struct device *dev,
>>>       if (!found) {
>>>           /* No platform data for this device, try OF and DMI data */
>>>           brcmf_dmi_probe(settings, chip, chiprev);
>>> -        brcmf_of_probe(dev, bus_type, settings);
>>>           brcmf_acpi_probe(dev, bus_type, settings);
>>> +        i = brcmf_of_probe(dev, bus_type, settings);
>>> +        if (i < 0) {
>>> +            kfree(settings);
>>> +            settings = ERR_PTR(i);
>>> +        }
>>
>> This looks wrong. First, you're calling brcmf_of_probe twice. Second,
>> if either DMI or ACPI probe successfully but OF doesn't, then you
>> return an error code instead of success, and also overwrite settings
>> with an error pointer thus rendering both brcmf_dmi_probe and
>> brcmf_acpi_probe useless
>
> Twice? it is removed and added few lines below.

Indeed, time to change glasses :) Didn't see the minus sign

> It does change the order
> so that may not be best thing to do here. We actually only want to
> handle the scenario where the clock resources are not yet available, ie.
> when -EPROBE_DEFER is returned because that error value is taken into
> account by the bus driver and tries to bind the driver again later.

Maybe we then do something like the following, which would retain the
old behavior but pass -EPROBE_DEFER on to the bus:

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
index b24faae35873d..6c5d26f9b7661 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
@@ -561,8 +561,12 @@ struct brcmf_mp_device
*brcmf_get_module_param(struct device *dev,
        if (!found) {
                /* No platform data for this device, try OF and DMI data */
                brcmf_dmi_probe(settings, chip, chiprev);
-               brcmf_of_probe(dev, bus_type, settings);
+               if (brcmf_of_probe(dev, bus_type, settings) == -EPROBE_DEFER)
+                       return ERR_PTR(-EPROBE_DEFER);
                brcmf_acpi_probe(dev, bus_type, settings);
        }
        return settings;
 }

>>>       }
>>>       return settings;
>>>   }
>>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/
>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
>>> index e406e11481a62..5f61363fb5d0e 100644
>>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
>>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
>>> @@ -6,6 +6,7 @@
>>>   #include <linux/of.h>
>>>   #include <linux/of_irq.h>
>>>   #include <linux/of_net.h>
>>> +#include <linux/clk.h>
>>>   #include <defs.h>
>>>   #include "debug.h"
>>> @@ -65,17 +66,21 @@ static int brcmf_of_get_country_codes(struct
>>> device *dev,
>>>       return 0;
>>>   }
>>> -void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
>>> -            struct brcmf_mp_device *settings)
>>> +int brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
>>> +           struct brcmf_mp_device *settings)
>>>   {
>>>       struct brcmfmac_sdio_pd *sdio = &settings->bus.sdio;
>>>       struct device_node *root, *np = dev->of_node;
>>> +    struct clk *clk;
>>>       const char *prop;
>>>       int irq;
>>>       int err;
>>>       u32 irqf;
>>>       u32 val;
>>> +    if (!np || !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
>>> +        return 0;
>>> +
>>
>> return 0 implies this function has completed successfully, while in
>> this case it's obviously returned early due to not finding the correct
>> device in DT. -ENODEV perhaps?
>
> This was a void function so returning 0 retains the behavior as before,
> which is important to keep in mind here.
>
> This function will be called if the platform has CONFIG_OF enabled.
> However, that does not mean that on every platform there is a node
> defined for the struct device being probed. That is fine if it does not
> require any DT properties to be functional. Hence we bail out here
> without an error.

Fair enough, thanks for the explanation!

Best regards,
Alexey
