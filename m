Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999125;
	b=rFoggZ4gFfoa+NV8kRvoyCOMOByQ1usT3hcg7UwD92Gan0wYDMkxlPluDtbp7H5mgB25
	 p+J9ymoCdQJtQdv3W9H95ceTIcnuVDmW71ZhJ/5aoOry22OuwIjILFuNXLDeBwLJrSSi8
	 P+NcDtIccv2trx22hsWRrWo8hu0IS5HciHIYGHSziHXblgRphOfM1fgxWHF+VI7Ba6t/E
	 nLodFpQDsO0w1+LMPF+yYkulA2ZgmAqKFeClY3Mjx288oBXInO+8W7Fzf8q3MvTKlTVUi
	 +VpPzgVphBELAWgF0SXQZWPxDAA7PgLIUUrUNgyrGsj1rnpJlt13+ydNV5BpecdVq6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999125;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=FE7v7dHvmS75LoRvG3gK/6EpuUCCumSYtyu9zFwPn9E=;
	b=PAU8eMFB1J5UroRQmjDu0lplKybMXSgKXh0l/KnP3BVIoSDQeflF1Qbtl+4DNEXBBKc+
	 NGFGN1cvpY1qBv4mmPglOFRW+yLZ7ILu9/ljawgDLy1tf/t7Yc3CFxrGOTP12vl8ImBdW
	 2B0tOFw6uUxVypTqNr/5RnvYd547x7pxW2MlGYwLCWmjNN+eXuqW3jYePH93Kbu59Z5fd
	 TUjMI3/9bWs7ufclRc2JKo27mPyK82LD2TU5euuYTC1nXZptb2d+oCSVXet5FSsvqb2pO
	 cR/JRmiN0k+TaG/bAvxFI0di1/PTezPFnaqXUy/tiVwcd/KEoC+GXdXjj11fe0h/nLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IKsURqz1;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0DF606A325
	for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 10:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B0DF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IKsURqz1
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso480097a12.3
        for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 02:52:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999124; x=1795603924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FE7v7dHvmS75LoRvG3gK/6EpuUCCumSYtyu9zFwPn9E=;
        b=BaUEIWO2t5Wp8HpNLs/wupCzMCPIh7xofQEqKW5/i9dJ6zJqhgVQLLAmEDrGo0n3UG
         E+dy+A7fvD/7Ogl20sd32iOzvsdFe+0CDbEInRxO0ZoLOeZNac/pXXnIDaLMkuTygEa2
         YoFEfJ+aX7HIT16IPMwd3FkF10i+tfRb5Q1AxlWK1RJA0dz9cr3BCe3z7m3sYAiCFfyh
         mnSQK68Ekpeu/duLrg3Uv9KPELacF04DU2nJBPLq6CQ3TjB2lUJjd/9fAL5ciyjGB8e8
         eKa0jumU6hDXvkwGorViXBH9RJQ8g9RAeUS3HRk9B7F84LiBXoZ/4RxzXvyFA2vCY5AM
         EbOw==
X-Forwarded-Encrypted: i=1; AL+hErFn2AOYi/O9MXWCwOkMdVhBjoWz4qGc1OUWB0iGbmT3tQ94pmjLte6jjjpXGSuD33Ot7i+TstOTzZQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Or3F/j/ZtbZyT44uS/SlI8SA0EpwXuGxRDv4RkQdfAa1jxpOy
	J4FLpWmWIRvKPGm0E4TiL/8T+Yd4GQiwo/u28JpembBJekdOld9ozVSTNlVKoLcB4QCSjNJfteh
	6qzTOwkB6simvyKBKCYcE3ty/HsMnTovrQB6pJ5f///jQNvZizCKQ2/BZE7GOKMjM0RpUEg/v3L
	JebSwFNOUa9xMtAneXZx4DC8iOT1Wkl+XibLATr5iCzJl1DzhVM0R5o6T1zsfStoRGRBgqyQF/K
	N7pNIyU6O7YUCac1SXQ7A==
X-Gm-Gg: AZFdTZeSD09eAIniqcfvWXsLhlzkQ/ENjvGgo/5y07DyC+I6Gl1mHcqTY7+QOiNqEVm
	yzjW/KyuVgLXSt0LvHGMbjGrhoWYG76VeHS0ZWGVOxX/KYtdfnteUsjwGktd6aaoEB/qgc717xv
	cwn2PP59FET3EjwVnjUMhwF++3vD7+Lj/1AVk46Pl177PRaZDsZecyZRygexIvQHB7UtZTITd/h
	6F1md6tvapuNh0nt2PfSkb8quTiVI+IUdyh0AXXpCUSQjy0cWC8opEjsTAss7IrieHu9+21p3Ya
	7UZWVE2DeV2iHYqA/etomQAbuU1ysiYmk3+EONeJUzjQ3ZhaJaP3Xd6pGCwo8ZeMEN6KWkgBPnO
	uTkIc/XsfPaQaUy252iM4Oy3FQkX8ydS2ydT8oaSBCzAKlpR+nfGTjeH7H0x3k6NcVxXRUq1Wv5
	dcMUKhtN/rAAg+bd7nrcCpQH7h0wmMGAmpLxd12Eo=
X-Received: by 2002:a17:902:f607:b0:2dd:c0ff:e72c with SMTP id d9443c01a7336-2eff75510ebmr19967635ad.62.1794999124253;
        Wed, 18 Nov 2026 02:52:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2eff5ee0058sm481035ad.3.2026.11.18.02.52.03
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:52:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d2f5f1e1dso12376311cf.3
        for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 02:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794999123; x=1795603923; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FE7v7dHvmS75LoRvG3gK/6EpuUCCumSYtyu9zFwPn9E=;
        b=IKsURqz1exxoVJsaAmBg5UYW9hmND8IdGwkqB+Qwsyvi1PQmc+XvfgRv1FWnjoxvlu
         BBPK0sXxty+GX30rWMpff3dXJnADgSowFUhtYokyOR9HPEI1l9okMx66dLN6plXMo7xK
         s649UmtD76Vowx1KDfVTYajyUBCF50k3LEZJU=
X-Forwarded-Encrypted: i=1; AL+hErEuHbnT4/pRKB1dkV9SOpH1pxHsCA8yGskbv0AJCCXeuw2LiKR0CfjNrFsGfr9EsJbDXfZcjo5o9g0=@lists.linux.dev
X-Received: by 2002:a05:622a:5b8c:b0:536:5004:6347 with SMTP id d75a77b69052e-55d5a57e275mr32115791cf.25.1794999122909;
        Wed, 18 Nov 2026 02:52:02 -0800 (PST)
X-Received: by 2002:a05:622a:5b8c:b0:536:5004:6347 with SMTP id d75a77b69052e-55d5a57e275mr32115451cf.25.1794999122352;
        Wed, 18 Nov 2026 02:52:02 -0800 (PST)
Received: from [10.176.2.72] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d5907bb80sm19852041cf.17.2026.11.18.02.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:52:01 -0800 (PST)
Message-ID: <84585c89-9f57-42ce-8127-6a4b2da205c6@broadcom.com>
Date: Wed, 18 Nov 2026 11:52:01 +0100
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] wifi: brcmfmac: AWDL for AirDrop on Apple T2 Macs
To: Aditya Garg <gargaditya08@live.com>, Andre Eikmeyer <dev@deq.rocks>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>
References: <20261104151547.70333-1-dev@deq.rocks>
 <c93fa1b2-9d05-4536-9025-6c4d1e6e6b5f@broadcom.com>
 <PN2PPFCAA8F915813E84B62E1B2B919F11BB8712@PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <PN2PPFCAA8F915813E84B62E1B2B919F11BB8712@PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/11/2026 15:28, Aditya Garg wrote:
> Hi Arend
> 
>> I really have no idea how to deal with this series. AWDL is not part of the IEEE 802.11 so I can imagine the kernel wireless subsystem does not care to support this. From driver perspective I am not keen on supporting this upstream either. My limited understanding of AWDL was that it was Apple's variant of TDLS (802.11z).
>>
>> So what does AWDL provide to user-space and could the same be accomplished by TDLS? From the explanation above it seems AWDL provides more knobs to user-space, but not sure whether the awdl%d interface is merely a control interface or actually passing data through it (patch 5 implies it does). If my memory does not fail me then adding vendor commands is generally pushed back.
>>
>> Regards,
>> Arend
> 
> There has been a lot of Apple specific code in the kernel, be it HID, DRM, EFI etc. So why not a small bit of code in brcmfmac. We have never faced complaints from those maintainers in getting code upstreamed which is different from the standards, but is needed for the hardware to work. While the concern of unable the understand the code is valid, I believe the author can be questioned to clear doubts before upstreaming. Getting code rejected just because of inability to maintain is heartbreaking when people work hard to make something good. Also the patches are just for Apple Macs, and not for supporting AirDrop on random hardware, so it shouldn't be that difficult to maintain.

You are reading stuff between the lines that are not there. My concern 
was mostly related to the new vendor commands. The vendor commands are 
out of favor as it was used to avoid defining an generic nl80211 command 
and thus avoid true collaboration in building a device independent 
wireless subsystem. In brcmfmac we currently have one vendor command 
which allows user-space to interact directly with firmware for debugging 
purposes.

Also AWDL support is not about making the hardware work. It is a 
software feature providing the transport layer for AirDrop (and 
apparently t2-drop). I would say the same experience could be provided 
with another transport layer, eg. by using NAN or P2P. I get that 
downstream users are happy with the AirDrop-like experience, but that 
does not make it a must-have in upstream linux.

Regards,
Arend
