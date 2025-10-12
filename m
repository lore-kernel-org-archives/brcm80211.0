Received: from mail-vs1-f98.google.com (mail-vs1-f98.google.com [209.85.217.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CD721146C
	for <brcm80211@lists.linux.dev>; Sun, 12 Oct 2025 06:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760249548; cv=none; b=TiUP7FpxWbpkpyx1w+UUUNYaUvIvKl/+d3Pztkp9BinBFN2JcrTQW0DwWk+7RG98zNTM13RgPDubiwaSs/3fooi36DIQj7lzNQb6Bz/mzLkZ9LRIyUTFWC1TJiZXHnmSKSVz0wTgcaZf+JwDsTl81vS+/nS3hV3KXoJkU9PBZbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760249548; c=relaxed/simple;
	bh=f6Fz2uhUbKza6dYGWrICrcSXEb2K80K9HExqSGlev5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YKMEzt4LkC8dJfjIBJwmPVDiztBXbH3/+uhEvwqt5DttBc1mGyoC3ebT2ZD6dbHQ3Snj7b0Rbhi3FXukyhhhyjb7Z2J7bdOgIIHuijEOsePglOM8kEpCeSLy9qKweJ/Qgd5uJRT9uOXi+VP/8N6Nv6zxSLLL6yoYN4mbAG7nj8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TtgahMkf; arc=none smtp.client-ip=209.85.217.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TtgahMkf"
Received: by mail-vs1-f98.google.com with SMTP id ada2fe7eead31-5b99f5d5479so3148322137.0
        for <brcm80211@lists.linux.dev>; Sat, 11 Oct 2025 23:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760249545; x=1760854345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGy3QEsEC9E7GQd/sFuSmn6gxBXBQEO0dEXX07xnZj0=;
        b=w+lcvBvK/KZ62WJjls+HP4MXWUmvXXAFS4ti4SdjBnEgpqeGBzcqq6+1CFBN1y+U6m
         AtpuSONgvtZOOGOOv6hY5lR+nGxkEPM5oKxXx3SI6YKZy3A77aSHZHx8K6IcDZa7zkc1
         17/1N4L/pL4EO1YG3BDoMt47+jhVtjtsPUqCBdgjPQg9ojmEPL5MxQr4fmIQ/ZL0rLHV
         T5Zi3poXDct2goqy/hE8wmQtw/SMPwNlHOjlE7/yousa+9GRF4ICm1sqFRnEerkBSKxp
         XA04URbiz4vJcKD5BZbhwlNCfHxNFN9AGuXojqMavJf+d5LGxebl5iGJHtntiwHYGZfU
         XsPw==
X-Forwarded-Encrypted: i=1; AJvYcCUdl8WL6yZ0XUzEKxYSBmylzWxS/G4aOVaTnnaXCdPMoReOLfeLtdWfQgyTK/538nRXz7slQAYCpGQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqVnwRa37Yfz3zxjzBiQWCQ0NMeG80KkWulbLMSkmv6pOw29sO
	/ZDf9w1rgl/YYPH36YykFXtbUDL1IIidJ63pZqv08L9v2A6FyDyUXmz2+sxpz/RuzueFHfp0AqD
	jn7Wkm5XchuBmo11L6hjGTCXNBuhQmpKkEAnOFtwk1+QDBMVxwPPCndlWtsTToVDvw/dC45RvrO
	4oPmaNDUfQaVJRRc+34kqQkMr4fSkKU1lc3yzw5HDoz1XqIHgP3S9OaQGi8UwG+CvaW0VdHa6p2
	ro3nADdP8twjdX1q9U/Ng==
X-Gm-Gg: ASbGnct1yRmlxiitk2+UfWuLwnXkSWsg9DFR2JA0RU+qbPcFLNWh9RzLuNNm9sYR5eq
	MKsaIk9C+XYDOR99bl1frP74suQt/iWMqs4eFFkwZ/AbLnenA5n90LCUrPmLS019t3SvU6ZBRFY
	zWOWKAJjDZ4YPKfr/3Rn7g5M6YdH+WcgXNu7YGAzBJuZBosEMnFx1oP+ppLxSuCPOC6amzFJ4kw
	HS8djaYd/5D1X0F+deohBSFBacGTXxNsHrAtdIiIXe2ZM07oYIEAiMz+D8DjLuuixwP5ldDwXRT
	JtBn2iZRu0WXVLxx9FxgZC82K7FB0oG6U/YVuKqx7cySjsrC13rg6LQOAyHMmb6EUtlLlK450jr
	VBlRzSI2ulHuUPP/Y8kJ+XSWg9KsBqUcYAglKMQZGY1EoiqOHoYpxNrxFG9tl1owrPKSs14wLSf
	tCNo0=
X-Google-Smtp-Source: AGHT+IEfNrWpY3XZ/irdZYRRgOw0uxQI24OGt28uDI/ovGxfQbgU20jumUFUDv3nkMvVmSTdnrj0Tbsj3D48
X-Received: by 2002:a05:6102:3e94:b0:523:a3a2:2638 with SMTP id ada2fe7eead31-5d5e2557eeemr9237082137.2.1760249545529;
        Sat, 11 Oct 2025 23:12:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-5d5fc6c5a1bsm859100137.1.2025.10.11.23.12.24
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Oct 2025 23:12:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-634cdb5d528so5481462a12.1
        for <brcm80211@lists.linux.dev>; Sat, 11 Oct 2025 23:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760249543; x=1760854343; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RGy3QEsEC9E7GQd/sFuSmn6gxBXBQEO0dEXX07xnZj0=;
        b=TtgahMkfZ4sjHe4ZE9kqzZ8XgiGaOa6ynS/PjItEO/4L82uKMaDXhpPaabTHd2hZKI
         2BN4RKxRlkJg8r172nEc+lba+UZ/T9OG+vCMUyLFAYeh1s4VP2EEdOs5c/lzcK/YCUdh
         ZsvgpB1O+GPIqf6k+4+OHG5GTUe6VSCG9ScYI=
X-Forwarded-Encrypted: i=1; AJvYcCW4nnyCnN7LPhKUgBpNNeak8L+C8J9etqIUW4LHv8ByKjB4I3lQp9rj/bTR4xhrKlKLZv34gl+EUus=@lists.linux.dev
X-Received: by 2002:aa7:d5cc:0:b0:61e:d2f0:5875 with SMTP id 4fb4d7f45d1cf-639ba74b30bmr15712680a12.1.1760249543254;
        Sat, 11 Oct 2025 23:12:23 -0700 (PDT)
X-Received: by 2002:aa7:d5cc:0:b0:61e:d2f0:5875 with SMTP id 4fb4d7f45d1cf-639ba74b30bmr15712659a12.1.1760249542865;
        Sat, 11 Oct 2025 23:12:22 -0700 (PDT)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b71503sm6201052a12.27.2025.10.11.23.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 23:12:22 -0700 (PDT)
Message-ID: <ddfa0200-fbde-4739-b82e-195c4205c590@broadcom.com>
Date: Sun, 12 Oct 2025 08:12:21 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] brcmfmac: Fix NULL pointer dereference in P2P action
 frame handling
To: Richard Reigh <richard@govivid.ai>, linux-wireless@vger.kernel.org
Cc: wahrenst@gmx.net, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev, chris@streetlogic.pro, s311332@gmail.com
References: <9811a46c-70ab-4bf6-9e20-7882fe1d0c55@gmx.net>
 <20251006231306.131967-1-richard@govivid.ai>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20251006231306.131967-1-richard@govivid.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/7/2025 1:13 AM, Richard Reigh wrote:
> When iPhones query network information via the WiFi settings "i" button,
> the brcmfmac driver crashes with a NULL pointer dereference. This occurs
> because the P2P device vif is not initialized when handling certain action
> frames.
> 
> Added an early check in brcmf_cfg80211_mgmt_tx() to verify P2P device vif
> availability before attepting to send action frames. Also added a defensive
> check in brcmf_p2p_tx_action_frame() as a safety net.
> 
> Tested on Raspberry Pi Zero 2 W with kernel 6.1.21-v8+

Hi, Richard

Thanks for sending the patch and putting us on the right track to fix 
this issue. Very much appreciated. As you may agree the proposed fix 
from Gokul is preferred. So I will drop this patch.

Regards,
Arend
