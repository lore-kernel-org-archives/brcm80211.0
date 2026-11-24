Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551254;
	b=VUAkd+AN/EirksLPWBVtn5qwRsDb1V3XWX2EZVL/wlrEeiGqWAl3K7kB6ok5vDk2kMFe
	 my7ZqpbeuT3w2scJ7rndACntvLy1AZVj4F1pjVKwhGZB+esGe2CyytiMmFwwUc3VgqiCX
	 LjBG0N01deg1EHk4slOBWUSRrTJiSQbZL5QSmMiaHh9/keUNqWOgy6ke8ZQ5gu67ue2mj
	 Dg38GMh/yNOWfXcbmHxeo+cohBfBhi8dh0NMUWwe2mTvwPB4VzLYhpajX/FGA3AiV/e4X
	 kHVuokxBn1BwveQ1fSouvqD5f9F6uw+xXVHTnCoJAEk2EM/hxXQsT4L8a03+oP1HK7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551254;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=sWMng2gK46ULOr6GYv+vGFXJ5yN5fj1a7nEoF3ogRLY=;
	b=Q4OzP581EpKj3gk6RRzAyAqizRHUsUOGQAV7bY8+h3hZAL2kFo+PPPffYJbrPXyvgXjJ
	 xNf4ehxkNxxiqqL398Gzh+M1OixufAN0g3gcQM4t1Q7/xUbx7WUFfSeE+7D/OvOHfQiCt
	 jM+2R4Km3JDINd8xBbRmfhvKjYpQzz2B+QT8wnZzgVCVhJNQLJkgBDVkC7eDGG0Sd0hS/
	 cv8LeFMGsnsP2zu9WON/lJPTdNgs0FGaekx4xopoqPPRESDY93GqhNoFRl2P2BTOJQpYO
	 Xe2+aoDIgb2Buo7dSahCKafmg7wlAJ+9mC6I6WzVeNJ/unrt08MDd+fP9F4fEheyYfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Dnk4ACxp;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDD760A2609
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDD760A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Dnk4ACxp
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso2985263a91.0
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551254; x=1796156054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWMng2gK46ULOr6GYv+vGFXJ5yN5fj1a7nEoF3ogRLY=;
        b=IrUI4HJ5SGbGo7W2i/FT7ohetKXjPEMiB6DCiiJufUbN0VG8NGEBSU92lJHdsQJOqX
         6494Rh4eXRS48j9upjqjO6oCY4hEJnrrmBhDh60HFT902DbESf3G9EcGWmQF50mcKsxb
         AKFXTb71m6T/FViW+puEkeemsNxk9oxfxQ2vJyd6DAihXuTOMjDJz3iTXsn2B35AQFb9
         tLeCE5qN/a6FCzDiLHtRjHhQ+gFsk9dcoxmD6C66lJXwcD+z442tVLzAIhWkdVBgvF/c
         eyuRsnyKShC+BbqXRmf99ozDq3xi/JzB7g3GmsI8AHlwIiCBTd82TRR+LRcbCC1hnavQ
         oR2w==
X-Forwarded-Encrypted: i=1; AL+hErH6WTZWi8Me4GSksu8aW1Ah08ChFR4+YK+YoZrrqAzY8EsMpUCMvHAC6I41nx1lKsnDq/u/k83FRwI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8JnSt6wL2VsxmmQ8DzTgY3c8ZfIn28M0vvsrOncVN/XZrvHjbX
	5OAaey3nATI8UK2NmMEq0f1ESrA3DrhshSH3TiJn8GJLmgSjTLMahB6qbSUgFrKpNDm/joEVuFa
	90sORH6d/ZRcvjrC3qSyBVzj94AeBxEBAR0Ho64IoBFUjSGzFuKUmThrOknFzYKcfNcr0Jl/gZF
	QbxkFGITV7iDkY6YV5vpr99CfBSlAHT24/nX68R7gajkzESSzCiNn9ulRVRT3M4UiofkOdIm+Pl
	7GEP4Psm0ZQNXER0YaCdQ==
X-Gm-Gg: AZFdTZcPc70p33IgyZ+wNw6JffzqPRVHikJfofEweV/p3jDwPoGDvnY1UAc3aZ/jGS3
	nJ0O4t/Gkwycm+IAjosI77F6S0nl44zGw8RxVwjECxXZ5o49lKk0/J1O+isBji4/XK7LDbqjYYV
	DnIeaRtj1NvK3RtDVvWMtrptjV5ELe9WsB9YA8Adrmd/J2FzFBE3UBj03j/l7MScxsoovEebNUW
	YKuTdIbacEyyHFk3FstJAA369MG+5PF1CPoCh1ZQLZBqPt0LBFXfjpskxCXJSW7WXHR57bSRnIF
	Ks0QlQjS8qrScIE9TrJ6kKbnFNHztTDVJrFyIz5pL7R+dyzf81Rii6ygaPgw/GC2A92NvG1a5Yx
	CRGBIdOWzwevZiFvgb2uM0BlXF2KHABXR/eZNADWKHQyPxfoOcPTicciW7PR1t1ml9B1sFLLIY3
	GZbMDb9GUa0x2qK2tBd8OY6cgYiRil48BAawojBXA=
X-Received: by 2002:a17:90b:17cd:b0:3b3:ab8c:c7e5 with SMTP id 98e67ed59e1d1-3b41c95f65fmr14411168a91.56.1795551253612;
        Tue, 24 Nov 2026 12:14:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42a5a2de9sm10351326a91.5.2026.11.24.12.14.11
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5383c05fb2fso4202981cf.1
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551251; x=1796156051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWMng2gK46ULOr6GYv+vGFXJ5yN5fj1a7nEoF3ogRLY=;
        b=Dnk4ACxpHaWp5EHZyO2FNZW6qCM4yWagYdrdpXKNm0AkeAatvVaqTVN3QjE9gDYgbK
         02+AQWBtQyW/ulC53YZ+1E7QHuR/VeanVqpPABJ6COw3rjVMdSMF2iCGU/77dxT5Um2H
         FYPQIfT8g33n7ESDP1yqfYmZrqq4VGt2TXiAc=
X-Forwarded-Encrypted: i=1; AL+hErEBZj4qTkL4FuQDwAs0kL60PgBof/Xo7MmBYO9Gbuv+DajdMQUsXeFRIvG4Gv+tGXuNWNTAkY5eVTs=@lists.linux.dev
X-Received: by 2002:a05:622a:1aa2:b0:536:702c:f8e0 with SMTP id d75a77b69052e-55d76a5ada5mr294513281cf.49.1795551251298;
        Tue, 24 Nov 2026 12:14:11 -0800 (PST)
X-Received: by 2002:a05:622a:1aa2:b0:536:702c:f8e0 with SMTP id d75a77b69052e-55d76a5ada5mr294512731cf.49.1795551250673;
        Tue, 24 Nov 2026 12:14:10 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:10 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 5/7] wifi: brcmsmac: embed brcms_protection in brcms_c_info
Date: Tue, 24 Nov 2026 21:13:59 +0100
Message-ID: <20261124201402.3499613-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-6-rosenp@gmail.com>
References: <20261111042554.232998-6-rosenp@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 10 Nov 2026 20:25:52 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> The protection settings (struct brcms_protection) have the same
> lifetime as struct brcms_c_info. Embed them directly instead of
> allocating them separately, removing one kzalloc()/kfree() pair and
> its OOM error path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmsmac/channel.c     |  6 ++--
>  .../broadcom/brcm80211/brcmsmac/main.c        | 31 +++++++------------
>  .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
>  3 files changed, 16 insertions(+), 23 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
