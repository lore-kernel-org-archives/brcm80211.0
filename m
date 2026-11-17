Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944806;
	b=LuhzTERh8hhARSCXDO/DDrC2K5AMKppwHuoQQz1AgForeq2p3wqCLPikFna6Ral/DFK6
	 fXjIIFqMgC9ITsL/ym9rPYMdAtCyNpRkCZroWilHdiBUa76Vnv2sMjlnsR8M1n1+qiGEd
	 G3nOvnUG/G9tLZeq+wfCLoSllfFtZpRTnxX9fHtRQMU4RbhX05lVUMpYnwkRF2EcQVMP8
	 8hxsMQrxCRaBJAvg2uXXbKZy6xxCndbL7veieqV1k2fGaOV4VuYNl76EuJLnhsC3WBVfl
	 IUYkX0tEdIcgV8W/MSYXbocmP8iKRT4zHeW2ijF6Kwdb/0kRAphe7em4G7bNPkXohmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944806;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=aFd/RP58uuymd6sBgw7qEUvIDPwjlsp1rmxiXiW1mtY=;
	b=sHNZHcjs4DM4vlQOOTm1npgSwTHsAowRFnDdPpW6rbXFfkpzMBi/ujQE22fzNMCbB7kU
	 SQefy/2EbadmcCMZY+vESra4AFh2ZTvvtlP2fhK3Ub4+1Qfxqqr4020miBWYsfea+de8k
	 CnJ83CxPoo8kd3/vgVCRCwiBKk1xHwqTgVZKknie17Ljco3Fd89ag2V99VrJLb3iEjl7Y
	 1mbK0kHKpEuqgmWtbN0g2phC2WK9ouB+gr619sgg0aPGcXByB1Mlyb7JZdlzQnXHGIXam
	 yj+JAimY3/OmUR01a+jAGAv+qH+Xc10SuD9lnCSYqonbHi7jTY3DTdRwi7UeaFkgq3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dpVkUTMX;
	arc=none smtp.remote-ip=209.85.219.97
Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B895606A33B
	for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 19:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B895606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dpVkUTMX
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso862416d6.1
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 11:46:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944805; x=1795549605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aFd/RP58uuymd6sBgw7qEUvIDPwjlsp1rmxiXiW1mtY=;
        b=gp6m5bggnYQZuUwtqt7rBHfROebgb+Srss/rrGpBcP+KO5ibtNqU8T0MhwrPwM8jEH
         dODZQUdMEy5hb3Apb1n8DVUxNCHRu05bQxuI8WMshWTejNm49MtRAEQuIuIUcTik5egL
         kEZW+TeNl06nD0aM1yrj8KT12N+opy7ixvWQcOl0FTriu/uGRlkARuKjv2OEmZ8aeSF6
         7f4vduqCArhXtkBR9SnSHcd+TnfkReGeJI2XR+M9bIpl368ASubZlFJsK1QNKERb1iI6
         644uSTzTrrMBkOo26vJICeGXjDwFm9K4dn5Y7+v5gPwpkkE0cjOipwfD5lL1+hYdvOfS
         Abag==
X-Forwarded-Encrypted: i=1; AL+hErEPqaeQjUTieshPG8zq1ccNZS1YF3dCyYnf05gZVa9yaRPia1xcCu68n6vHe8ZwT8+Wj4SwjguPiC4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+JTrZHvlKrQfHJhiSkhlqGdL06Q+6uVpqWMIcjlNVibgMyEilJ
	kwBV6eAdHxnx0cYHhLMeUBdobopyoHu6MM6VND1/a/6i5/EfPPvC2X4u9U40moUF4l3P7r29J8A
	ODlDoBd+nVidzu+vK+fMAYCeVcKfGZzQR2HnBkrV+osYFRk4QSzAgPkfOtALNeyJJEa6QFqC0Qe
	p4YR865miv52MsiPewvcFKqs5Gw17huV6i0MHkbc5ISgiLb1OmKDd8RLXGUwgSOERD1qAzeiJvc
	G5iw/XR4WPUU4nGuG/DJg==
X-Gm-Gg: AZFdTZcuTpTxKFkAbezmB0gbnfks+2rLbet5UFcCyRzEzmk85NcPUgCgliyBlLAUjLU
	GhrWg3/cFlikolUSqVlfukcYwm8V95VzFZZupQ29xd2PQB1c153FkUBqdKgSmjtG8vofhSqwZNo
	UNczP00bIFpRlVkbeqrSOwM4zWS8WXb/nlOjsDzCYJFG1Vnw5uOhrWPcc+J68rI0ficJWOjL8WC
	hgPhnLkRgWqy71d5pXO0TksIDn1fQtWjbj5WSmA+iDd3C/iTc+wJJc/V0tB4qnjgDDvmk9/OIgI
	BCxTMb/oVrLcBQqml/eUkV1hT0V5UTZVjNk9lCHlH2BXYgu0PpKbKxMIIBelxP+5lalL2LS5x4d
	Bnl+Yb9mkS9/tPHFoTySFhvj+SJVKJdaY+iSgcXxsTxkBLP4/N71b20zHMrhc+7OcZjLT2+MxgN
	Hi9pbThmfimLrsuXUudYNGonOZvrVXfeOrh7e/gsc=
X-Received: by 2002:a05:6214:468b:b0:91e:d00f:f3d with SMTP id 6a1803df08f44-92114f42d3fmr2677476d6.10.1794944804743;
        Tue, 17 Nov 2026 11:46:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-921149ef72esm32136d6.3.2026.11.17.11.46.44
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:46:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c465c4c8da0so6679466b.2
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 11:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794944803; x=1795549603; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFd/RP58uuymd6sBgw7qEUvIDPwjlsp1rmxiXiW1mtY=;
        b=dpVkUTMXOLH5JGhPwhptTDOozjK1oQA0kotSovqq5upNMDDptuJc8ojPDusy/Pv5OP
         pHlzUwJvZ9K4IWXF5cJz2hHYA8tbFdjT6KGHZblmPkXLbIV+1YwMbX/5u5/E/TpMHGl0
         RAbwFXcU6KNaKxYlr57ZGhLgx811X80US9/u8=
X-Forwarded-Encrypted: i=1; AL+hErHfIYxQUZKtyR315HNIJUBltpX7S7aE1QApeaT6J8Wf32oG+F3v7aTw5TVdOtc6ZGm1kHJ/H0f/LaQ=@lists.linux.dev
X-Received: by 2002:a17:907:728a:b0:c50:48b8:22bf with SMTP id a640c23a62f3a-c510e4fcb61mr21125066b.36.1794944803154;
        Tue, 17 Nov 2026 11:46:43 -0800 (PST)
X-Received: by 2002:a17:907:728a:b0:c50:48b8:22bf with SMTP id a640c23a62f3a-c510e4fcb61mr21123566b.36.1794944802720;
        Tue, 17 Nov 2026 11:46:42 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510ca09c82sm16249666b.21.2026.11.17.11.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:46:42 -0800 (PST)
Message-ID: <716869b3-adaf-4155-88bf-638952dd358f@broadcom.com>
Date: Tue, 17 Nov 2026 20:46:42 +0100
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
Subject: Re: [PATCH] wifi: brcmfmac: disable TX beamforming on BCM4364
To: Aditya Garg <aditya.garg@linux.dev>
Cc: Andre Eikmeyer <dev@deq.rocks>, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org, Yossef Osman <Yossef.Osman@proton.me>
References: <20261116203719.281605-2-arend.vanspriel@broadcom.com>
 <2FBC4AA9-16FE-4710-B43D-9004B0B17DFA@linux.dev>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <2FBC4AA9-16FE-4710-B43D-9004B0B17DFA@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 17/11/2026 18:50, Aditya Garg wrote:
> 
> 
>> On 17 Nov 2026, at 2:07 AM, Arend van Spriel <arend.vanspriel@broadcom.com> wrote:
>>
>> ﻿On Wed, 4 Nov 2026 16:16:23 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
>>> With "txbf" enabled, the BCM4364 firmware (9.30.514.0.32.5.94, as shipped
>>> by Apple for the MacBookPro15,1) transmits a single beamformed spatial
>>> stream (nrate VHT MCS9 NSS1 TXBF) towards a two stream AP. With "txbf"
>>> cleared it picks two streams (VHT MCS9 NSS2) on its own. The firmware
>>> enables "txbf" by default, so the driver has to clear it.
>>>
>>> [...]
>>>
>>> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
>>> Tested-by: Aditya Garg <aditya.garg@linux.dev>
>>> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
>>
>> [...]
>>
>>> @@ -450,8 +451,12 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
>>>         goto done;
>>>     }
>>>
>>> -    /* Enable tx beamforming, errors can be ignored (not supported) */
>>> -    (void)brcmf_fil_iovar_int_set(ifp, "txbf", 1);
>>> +    /* Enable tx beamforming, errors can be ignored (not supported).
>>> +     * BCM4364 firmware enables it by default and then transmits a single
>>> +     * beamformed stream instead of two, halving its uplink throughput.
>>> +     */
>>> +    (void)brcmf_fil_iovar_int_set(ifp, "txbf",
>>> +                      drvr->bus_if->chip != BRCM_CC_4364_CHIP_ID);
>>> done:
>>>     return err;
>>> }
>>
>> The chip ID check has the same problem as in the ARP/ND offload patch [1]:
>> the issue is described as specific to the firmware shipped by Apple
>> (9.30.514.0.32.5.94), but the quirk applies to every BCM4364. Please
>> restrict it as suggested there.
>>
>> Also, the comment says "Enable tx beamforming" while the code now
>> conditionally disables it. Please make the code self-explanatory, e.g. a
>> local variable or an explicit if (chip == BRCM_CC_4364_CHIP_ID) with the
>> txbf value spelled out, instead of passing a bool expression as the
>> iovar value.
>>
>> Minor: typo "refression" in the commit message, and the subject lacks
>> the target tree (wireless-next) which wifibot flagged.
>>
>> Since this is a throughput quirk (not a fix) I would also like to know
>> whether TX beamforming is functional at all on the BCM4364 or just
>> mis-selected by rate control, so the commit message can state the actual
>> root cause.
> 
> Unrelated but Airdrop conversation seems to have been stalled :(.

Indeed unrelated so let me respond to your earlier email that was more 
on the subject.

Regards,
Arend
