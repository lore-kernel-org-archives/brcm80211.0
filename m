Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D715253370
	for <brcm80211@lists.linux.dev>; Wed, 31 Jul 2024 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722421022; cv=none; b=ZeIevIJyHQSSwhEIfv61T2qbd4fJWmk3gn6CWPjbXtB4r/ESI2wRK3On9sruJ3AuwozVq+MUIkDegMvlHCHHdLv7pMKYfpF7QIiLNXGPpGt5DzhTX7qlHCyu8rjwemliwLbk1v/NoSZmhJ5rZDI1XnDW4DWVjx7KgbPgUG7vWf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722421022; c=relaxed/simple;
	bh=6UjJVQFegPDjWvvKUdWh3ajOioWkd2LppLqQBIgw9r0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LXUmPbnwAOh4l4w69dLWmRotsg93oHFhzE8tIxBgRcI3L/NzEuTNgq3mX6Sg4hu8pFZ7gxVVLtuzu5qLwPzcjxq+1SiIGD05MS7R7uL2fJIyE6cox+aptmVBnBoh3Ri9dBzsxcatMCVDPuyhNRHC+dN6W6jzBKUrxt91cj1BPr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gi6i3Tnj; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gi6i3Tnj"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-530ae4ef29dso1609172e87.3
        for <brcm80211@lists.linux.dev>; Wed, 31 Jul 2024 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722421019; x=1723025819; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0AaaFuIf1xRzlWKEfSWSyC0cUztpO1y/p+yF/M4k91k=;
        b=gi6i3TnjpSfGIp+UYSJZOlfy14lXLvW0DJ/U/JbClgbxpjVzDuS+faUPVMHRPBRUPD
         Ic7iBVvVgqMnJW1H6YjUagHR1uRjUQBiujwOA4Qg8dlNJnI0FuvKyplLMw9XFUFYhXTg
         TQZbp4wPcVrLzgES/qLN5bOCaGRlEzIaiqTD5oQBZi1oDZkelxqLHn/gezXTVxVV1PqO
         MPhiAZhbW7BMaMPNqbAh7zK/TBHIlau+PAp1UHoIXaAeeAaWsLzwSkpZEJkWwuprKw3b
         oo0NOQmSciqPB01rH1ncIhSFrrSgoxw3ADtRy+sBywC7uIYwMfsXIBmSrCUf+14KWN+t
         vg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722421019; x=1723025819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0AaaFuIf1xRzlWKEfSWSyC0cUztpO1y/p+yF/M4k91k=;
        b=qyedKHR02iK+q9pkKTiYlFfS5sqtkL6NSQ+5cxThj0bRGYny2YgpYzCWWdsogVb5sa
         WviuBWE+JYnaPgU0msR/v+4vpAtwanGT6mTy8XmLA0O2KDD2s5mL51j0Hi/HE2xdSHN2
         8sMkjpkDiREYvjymBXoHJfz7Y/BzyVuPawPUQtoiADpvr8tEMCnojGfD4ExRRNwNawcl
         gHKZykoECzwdUN74Q+myucbzJRNXTV2h6ZPtDwfHeyzBOnc2ApD4QleyturGA4lzOLC4
         afDvnmJ09hXyD4gPuwC7J2176E3DxZGJ1pRU8MonEmETebDZLEoUmxwVoyhTAcv4mX2H
         6fMw==
X-Forwarded-Encrypted: i=1; AJvYcCXnTwdTw7x9OR+S0dSLI0t53erxbg01Sb6Sqk4//SxXzCgINChPvXmDKHhWfMZpZ95vYUo5sKml+EE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw50MJozJmjIwbhMkpOYwvK9vQP/vVkQnMpi662ULepkqt92naa
	yM8xT1l74TaTKkyLC5YOQRA54mLdzUnLne3IL0ge5X8JGX4dGaKu
X-Google-Smtp-Source: AGHT+IF2e1PeQYS2su4wh/SIyoSoRuTA/mOWzxXZEnnmqqjxiriV4Tt63IghqsPDtpogPid6UjTSbQ==
X-Received: by 2002:a19:8c11:0:b0:52c:c9e4:3291 with SMTP id 2adb3069b0e04-5309b2e0b50mr8248953e87.60.1722421018492;
        Wed, 31 Jul 2024 03:16:58 -0700 (PDT)
Received: from [172.30.17.119] ([194.247.191.114])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c0820esm2149509e87.167.2024.07.31.03.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 03:16:57 -0700 (PDT)
Message-ID: <0a78a0fb-0a5e-424f-a801-4a63b9ee1a49@gmail.com>
Date: Wed, 31 Jul 2024 13:16:56 +0300
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] wifi: brcmfmac: Add optional lpo clock enable
 support
To: Jacobe Zang <jacobe.zang@wesion.com>, robh@kernel.org,
 krzk+dt@kernel.org, heiko@sntech.de, kvalo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 conor+dt@kernel.org, arend.vanspriel@broadcom.com
Cc: efectn@protonmail.com, dsimic@manjaro.org, jagan@edgeble.ai,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 arend@broadcom.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 megi@xff.cz, duoming@zju.edu.cn, bhelgaas@google.com,
 minipli@grsecurity.net, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, nick@khadas.com
References: <20240731061132.703368-1-jacobe.zang@wesion.com>
 <20240731061132.703368-5-jacobe.zang@wesion.com>
Content-Language: en-US
From: Alexey Charkov <alchark@gmail.com>
In-Reply-To: <20240731061132.703368-5-jacobe.zang@wesion.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jacobe,


On 31/07/2024 9:11 am, Jacobe Zang wrote:
 > WiFi modules often require 32kHz clock to function. Add support to
 > enable the clock to PCIe driver and move "brcm,bcm4329-fmac" check
 > to the top of brcmf_of_probe
 >
 > Co-developed-by: Ondrej Jirman <megi@xff.cz>
 > Signed-off-by: Ondrej Jirman <megi@xff.cz>
 > Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
 > ---
 >  .../net/wireless/broadcom/brcm80211/brcmfmac/of.c    | 12 +++++++++++-
 >  1 file changed, 11 insertions(+), 1 deletion(-)
 >
 > diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c 
b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
 > index e406e11481a62..7e0a2ad5c7c8a 100644
 > --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
 > +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
 > @@ -6,6 +6,7 @@
 >  #include <linux/of.h>
 >  #include <linux/of_irq.h>
 >  #include <linux/of_net.h>
 > +#include <linux/clk.h>
 >
 >  #include <defs.h>
 >  #include "debug.h"
 > @@ -70,12 +71,16 @@ void brcmf_of_probe(struct device *dev, enum 
brcmf_bus_type bus_type,
 >  {
 >      struct brcmfmac_sdio_pd *sdio = &settings->bus.sdio;
 >      struct device_node *root, *np = dev->of_node;
 > +    struct clk *clk;
 >      const char *prop;
 >      int irq;
 >      int err;
 >      u32 irqf;
 >      u32 val;
 >
 > +    if (!np || !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
 > +        return;

Did you test this? The DTS patch you sent as part of this series doesn't 
list "brcm,bcm4329-fmac" in the compatible, so this will probably return 
right here, skipping over the rest of your patch.

Please test before resending, both with and without the driver for the 
Bluetooth part of the chip (since it also touches clocks).

You are also changing the behavior for other systems by putting this 
check further up the probe path, which might break things for no reason. 
Better put your clk-related addition below where this check was 
originally, rather than reorder stuff you don't have to reorder.

 > +
 >      /* Apple ARM64 platforms have their own idea of board type, 
passed in
 >       * via the device tree. They also have an antenna SKU parameter
 >       */
 > @@ -113,8 +118,13 @@ void brcmf_of_probe(struct device *dev, enum 
brcmf_bus_type bus_type,
 >          of_node_put(root);
 >      }
 >
 > -    if (!np || !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
 > +    clk = devm_clk_get_optional_enabled(dev, "lpo");
 > +    if (!IS_ERR_OR_NULL(clk)) {
 > +        brcmf_dbg(INFO, "enabling 32kHz clock\n");
 > +        clk_set_rate(clk, 32768);
 > +    } else {
 >          return;

Why return here? If the clock is optional, a lot of systems will not 
have it - that shouldn't prevent the driver from probing. And you are 
still not handling the -EPROBE_DEFER case which was mentioned on your 
previous submission.

Best regards,
Alexey
