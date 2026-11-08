Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794152509;
	b=UVAklGUMDb+nKIjONqCJkZoN3tb5D8/tcAWYD6RzlCFnH5SmBUNSt+dvczLieSZuNvr1
	 +FdbfDdhd0LjH8hxDwPJxhQkdTBFheSCsR35n0y+dHBdhNSc616ybDqT3/+JvSXq97n+M
	 r3L2uf571bzAIFl0qPGDPLK6Sud3/D/cAeTwcM8QIKWIAm6t6q2wwVwxLCUQyH26XlUQ8
	 KeSuGroR8KGD9emg60tG302enjri75/C2+qrlD3Q5/K/EiW7irw8HHpCxeh+VKCU27gHa
	 3LHeYup1WrcDPBVJiUEIklpmCfbne7jfLTFBTB7tJWMIxLEjhkVnr2yXuoE32iJyBCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794152509;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=5yCu6EdDfR4gzCOuCd5mbFeaXjz0iD8JjCv3Au6Mdwg=;
	b=VagiSLQtN2bAs+j4AzQWUijbUODGoiTxAs9ZWm9fF6x0lbBKnPkVtHnkwg2Tz98QmXRu
	 mN7SnX8EGsSf4ZpcA40y9TZSTI3G0rgLn6CpViMKXaOir1JDLCfVZ/MUB9nmNCGt3ibaj
	 iMA1dXXXh18Ueiome6V/DRKUNXlZXcpqLtl0AgbNSseoDIIWckN7Ro9x4U0IMW97zyjWy
	 j4tXxSJRV5Ztikkm6WcBnO1VEfkiAX8tgUoVMzcvULCLpzEtOSwUlqgBOghcBT9p6z0RN
	 jqWov1GlZ/skA/Ehr9DKSReVoq86QrBNBemBLJLxs8BodCp+FXfMxuS/6xs//H0R38w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=b+78CBrG;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8346606A320
	for <brcm80211@lists.linux.dev>; Sun,  8 Nov 2026 15:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8346606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=b+78CBrG
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso58461a91.2
        for <brcm80211@lists.linux.dev>; Sun, 08 Nov 2026 07:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794152508; x=1794757308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5yCu6EdDfR4gzCOuCd5mbFeaXjz0iD8JjCv3Au6Mdwg=;
        b=GOCRFXkO6hnWw6L8L2QZsIt20KvpSYAQlw025Eqf84vMRlNjCZvPTUA/r8ILWmFAJH
         QZxCvfvRKe65Upip4CBaBWbu5JxuplSNoLl+yV2SwgpDHtwXAxdoAOF9aVcXqFp3vSGa
         as0TTYBFrtc/wENDIDCWiqVdCdl5hDAF4QFZkPyc6s/78K6He57BZRBLEZiOz/hxQWe0
         iaKJv3ebh6haVlpOOHmARBS6FbC7HLkvV+d6xpRru/WJX+YTeoQqUZQawVkUpgyNxDlw
         t0YFXmFSYhQjs/DOa/RJTJo9XIDaetG16wE7/UHnfTSET6uOeLQZDFnCjWXjW8Y2nFSm
         sbNw==
X-Forwarded-Encrypted: i=1; AL+hErHufW6QLkjdGUChidqIcYrxVKE5szjpu/2p2Z7DGNxOBSXNZl2wSjDCtbGkXKbg1FhrqdNoI98U3i4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+06Z+WKhFvH73NIH2Q7Gu+ymvcsLMrElYylOVlU67SDgAcbpVh
	mkQ8McsU2LK8X4jvR8IL235nBevk9/qa7Xf5erFHlhRIYNgEJtqBUtDmd8J+3hlIv9tHay0JwhE
	g841F7X9vff0eH5yVzsWlJvVA3EaW23kvniFaUQkMRkS37OgGo358/DLsA/9wy+H8caigEqgOLI
	az3vvCNGjFR15fkw6WC4fQ68pu7+WG1oq8Y0XYDFzqBHUygN59kKPmhhNLL96jwI6sguLWRYHp9
	eJ+6VxWVPmpcmesH/d3EA==
X-Gm-Gg: AYBFou3xO2CUpvoUhqPuchCvPg57OktReHlrqPyGjm07H6UuxcmGv2eTAeopghdfPYg
	7qSz5W1lCkCN0UXlRKRHaugGwjKCRki3C0xI4NAKbojCoUCejwRs//RVpdo04iwVlJPSmeA4Hq2
	fCo2iycqMSH6qvqBpUPv62RryDAbEsgoHU+YJrSNPrasbjjs74/PLnHF9LMYcpxqLcYNA8yu95K
	VN3aeeBXZmgB1W7moH9MCXl+q68KCnuUe1dPAchizYqPV9hLHrVbmL2tZ9XF76L2E3ECbvJCdTy
	4u6cMUmBgN9vDNvBcZpKonIPoVN16s5JJeQhpbFV1y+vnBMfGzYOXH0LJr5nu43kmfAhQ7s9BsI
	yH3sgPqm2m5O6yOp7YxpUIgYtbnW+pXlTb5bCpNy+oc5W5yZ1hyCUtYOih7Kc1PZLqwerobgsi2
	S06n5yWPa5c9rEd4lQFDlvXHwyUNf3mtef8fY7Q0c=
X-Received: by 2002:a17:90b:3846:b0:3a8:86b7:ad95 with SMTP id 98e67ed59e1d1-3b12d551ea2mr1476411a91.60.1794152507910;
        Sun, 08 Nov 2026 07:41:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0fc1a1f49sm2259770a91.0.2026.11.08.07.41.47
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 07:41:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1663fb7e005so132334c88.0
        for <brcm80211@lists.linux.dev>; Sun, 08 Nov 2026 07:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794152506; x=1794757306; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yCu6EdDfR4gzCOuCd5mbFeaXjz0iD8JjCv3Au6Mdwg=;
        b=b+78CBrGxQ6vmLMMmrW9AYS/ZHf5vRaMlEMDj1k8ENQwdahHKVOmicBBXmkoos/1tk
         CWEcVWTKseG8izNTow8qiC1POTjeghqhT0j5BIlSwEKUzshh5j0JpOMob6xh5hXLjI45
         iHFhSxoGmS8+i8OkMUVs8lM+GZIY0gtd1RX30=
X-Forwarded-Encrypted: i=1; AL+hErHMzh34WuKH1gRZZgTIkwLWPh+H9yQwxo+QSo2HDW+BWopWHGwU++OjWgfKyI3M0co3lMAOUPFEF/M=@lists.linux.dev
X-Received: by 2002:a05:701b:2802:b0:1b0:20:6444 with SMTP id a92af1059eb24-1b39feffbdfmr2453825c88.39.1794152505952;
        Sun, 08 Nov 2026 07:41:45 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1b0:20:6444 with SMTP id a92af1059eb24-1b39feffbdfmr2453786c88.39.1794152505155;
        Sun, 08 Nov 2026 07:41:45 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm7469375c88.6.2026.11.08.07.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 07:41:44 -0800 (PST)
Message-ID: <c93fa1b2-9d05-4536-9025-6c4d1e6e6b5f@broadcom.com>
Date: Sun, 8 Nov 2026 16:41:37 +0100
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
To: Andre Eikmeyer <dev@deq.rocks>, Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20261104151547.70333-1-dev@deq.rocks>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261104151547.70333-1-dev@deq.rocks>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 04/11/2026 16:15, Andre Eikmeyer wrote:
> This series adds AWDL support to brcmfmac, so Linux on the Apple T2 Macs
> can send and receive files over AirDrop with Macs, iPhones and iPads.
> 
> AirDrop runs over Apple Wireless Direct Link (AWDL). On these Macs the
> Apple firmware runs AWDL itself. The host creates an AWDL interface and
> sets its parameters. From then on the firmware keeps the AWDL schedule,
> sends the AWDL frames it gets from the host and carries data frames to
> and from the peers. Election, peer discovery and AirDrop run in user
> space.
> 
> The driver enables AWDL on any firmware that announces "awdl" in its
> capabilities and supports interface_create version 3. The linux-firmware
> image for the BCM4350 (7.35.180.133) on a pre-T2 MacBookPro14,1
> announces "awdl" and answers interface_create with BCME_UNSUPPORTED, so
> it stays without the feature. Other Apple chips, such as the BCM4355,
> are untested.
> 
> The KaiT2en community, about 280 members, runs this series with its
> kernels. Users reported it working with the BCM4364 and BCM4377 on the
> MacBookPro15,1, 15,2, 15,3, 15,4, 16,1, 16,4, MacBookAir9,1 and
> iMac20,1, and nobody reported a regression. AirDrop transfers on the
> MacBookPro16,1 and 16,4 are slower than on the other models, the cause
> is still open.
> 
>    1    match firmware capabilities as whole words
>    2    move the interface_create definitions to fwil_types.h
>    3    detect AWDL support of the firmware
>    4    create and remove the AWDL interface
>    5    add the AWDL data path
>    6    add vendor commands for AWDL
>    7    pass AWDL frames and role changes to user space
> 
> Patch 1 is a fix on its own and carries a Fixes tag. It is here because
> patch 3 adds an entry next to the lines it changes.
> 
> The AWDL interface is a network device "awdl%d" outside cfg80211. User
> space talks to the driver through typed vendor commands and events of
> the Broadcom OUI: start, stop, frames, sync, peer add and remove, and
> events for received frames and role changes. Creating the interface
> needs RTNL and vendor commands run with the wiphy lock only, so
> AWDL_START and AWDL_STOP run in a work item and report their result as
> vendor events. The driver sets the firmware parameters itself.
> 
> The firmware interface was worked out by tracing. A dtrace script
> recorded the iovar calls macOS 15.4.1 made to the firmware on a
> MacBookAir9,1 (BCM4377) while AirDrop was opened and closed in Finder.
> The other way round, the MacBookAir9,1 was traced as AWDL peer while a
> MacBookPro15,1 (BCM4364) brought AWDL up under Linux, together with the
> AWDL frames macOS received and the console and events of the BCM4364
> firmware. The BCM4364 handling in patch 6 comes from these runs. The
> iovars, their order, their values and the AWDL frames come from these
> traces and from the frames the firmware passes up.
> 
> The user space side is t2-drop, part of KaiT2en-Fedora and published
> under the GPL:
> 
>    https://github.com/kaiT2en/KaiT2en-Fedora/tree/main/apps/t2-drop
> 
> With it, AirDrop works in both directions.
> 
> Comments on the vendor command interface are welcome in particular.
> nl80211 has no AWDL interface type, and the AWDL schedule and frame
> exchange run in the firmware here.

I really have no idea how to deal with this series. AWDL is not part of 
the IEEE 802.11 so I can imagine the kernel wireless subsystem does not 
care to support this. From driver perspective I am not keen on 
supporting this upstream either. My limited understanding of AWDL was 
that it was Apple's variant of TDLS (802.11z).

So what does AWDL provide to user-space and could the same be 
accomplished by TDLS? From the explanation above it seems AWDL provides 
more knobs to user-space, but not sure whether the awdl%d interface is 
merely a control interface or actually passing data through it (patch 5 
implies it does). If my memory does not fail me then adding vendor 
commands is generally pushed back.

Regards,
Arend
