Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE6D79B9D
	for <brcm80211@lists.linux.dev>; Tue,  2 Apr 2024 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712055468; cv=none; b=pmZ9HEb8bqxSPfazM2nkKwUV2m8TqbDJBoWwjNGElMen9UUB/Wyg0yq/jo4tdOtqRRjZx9MPZP3Gvh7IEkA5/umI+t55HObKvnjzbi69p4T2N5Ji5TD21Y20hpYlr97JRg5QvN+0TSd78EDQkh5ETBvzunXgnVQSmK9/8Oxg+ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712055468; c=relaxed/simple;
	bh=Hr7Xp50rW+8exIfPBdNB+2gt14zjJGKAfeBvyG31h3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZNyKZfuuwN7SLLesEGSy2idfTKCrnjBw3JeQS1KBkXUTfJcrgDOq5vCCmz/UHK4fc7sRrGgnw+Lnv5CB/RiLede4QAA/0snM0FTqqPycn21eX+ABLfL0AyuNZNBZnTU7ZGgC2Y6a14IfBtn0YG0ep9L9qQwfT5OTawhMBD2Lqxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CCT8nq2F; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CCT8nq2F"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6153e169066so1170837b3.3
        for <brcm80211@lists.linux.dev>; Tue, 02 Apr 2024 03:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712055466; x=1712660266; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=heR2AZ16RGjephYYk3nVkJQSU4kssIE/CVztHg4PbLw=;
        b=CCT8nq2FnQMkgN0u2G98F75R+wTyprbWoKaTgz6PtlydPW2e+DVSPC0xPkHEVlO3hx
         q2PpKzzB7uxjRN+dVW+Qfykkw1z8HU0sG8/XUOm5c9HgcxK/Qbz6AW5DekqAH9NLh8/d
         Se0/okXhMjdeH8my3z8QwvHvZs9o+xycVUJlHnX7u6zMVQjunAxypZpfs0Tur1zxAxkc
         G0zuNIx2lRyjdTQM2k0gFrw0z2RTXg9EQaHfkExjFdOuAbPbkJV0hexMoiJtV6PBszXp
         MDouXM3VGjscZiimff+BBhKAaSj4H8w/kR1/4ibHAAE0a0UK9I1Rnmnai0yD1eooyyg4
         I6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712055466; x=1712660266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heR2AZ16RGjephYYk3nVkJQSU4kssIE/CVztHg4PbLw=;
        b=fLpu7SAqO6veEB3VTpwbr76DKMMi5ro3UrBFQySZQcKzIKjtl9GFcwkhfnaMrgotgg
         Vdrak1WEzdw6a4h99gtUUUGo7xVG/e2QCPWWCf82CX9MS2dB64F5/QBwar9y/HsCqq0B
         +A/lhYvAdlMFO4OPXSh39BznWn6E3Xl/lYzYerFqYI+j9s/P1Pyuaj2zsPcTdlZOrq6s
         ykzc922TqZH/+Q2jM/Xmm47LvEJmwEp7leGscbVAJL9/5YsGXkcU3AqQbf+0B3JuzUh2
         XCV6B56IfpzAFxXbTBmvztve14Csv5jWIYehYcbjJrAstoosWhp+yENh8/cEIEENQzZ+
         z/gA==
X-Forwarded-Encrypted: i=1; AJvYcCUbQLag5+FNuGNslEnCXpntvYsf2t/LN4/hSiruCMGPOXYgeS3hjpTDzOIz7o4FvyGDglXEcMIvMBdw3pIyUepf1rVC084S98nd
X-Gm-Message-State: AOJu0Yyk/UVFLGmw7ZYN8YKEpDXRpIqbdoJjvh1YuW4SOwqGG99UlLE6
	nr4ncfOhg/tQPY/JurMXrQkwpsXHf00nAcHAe3ZFRcl1J/AhZb5fpd311hSE8N+heCBhWtrIzSA
	+aQzgNpAvZnEzFENZKn62OxJfAqbl7LqG+RZC0g==
X-Google-Smtp-Source: AGHT+IG0hl043sikYSStWfJMtXPIZPLFFTefeWAq9LsJotUVsTuh5FFEl/udwTnzeyfi+7Th8cC2dNNikPb4b1WN2ok=
X-Received: by 2002:a81:5d45:0:b0:608:e133:7ece with SMTP id
 r66-20020a815d45000000b00608e1337ecemr11694233ywb.36.1712055465511; Tue, 02
 Apr 2024 03:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
In-Reply-To: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Apr 2024 12:57:09 +0200
Message-ID: <CAPDyKFqct4ZV3UbTzWKO08MzDTm_BX6K02kefV26mEain0SXqA@mail.gmail.com>
Subject: Re: [PATCH 0/7] mmc/wifi/bluetooth: store owner from modules with sdio_register_driver()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	Brian Norris <briannorris@chromium.org>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Mar 2024 at 18:24, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Merging
> =======
> All further patches depend on the first patch.  Everything could go via
> one tree, e.g. MMC, or the cleanup patches removing owner would wait a
> cycle.

Patch 1 applied for next, thanks!

I can certainly pick the remaining in the series through my mmc tree,
but waiting a bit to queue them up to allow some more acks to be
received.

Kind regards
Uffe


>
> Description
> ===========
> Modules registering driver with sdio_register_driver() might
> forget to set .owner field.
>
> Solve the problem by moving this task away from the drivers to the core
> code, just like we did for platform_driver in commit 9447057eaff8
> ("platform_device: use a macro instead of platform_driver_register").
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (7):
>       mmc: sdio: store owner from modules with sdio_register_driver()
>       bluetooth: btmrvl_sdio: drop driver owner initialization
>       bluetooth: btmtksdio: drop driver owner initialization
>       wifi: ath10k: sdio: drop driver owner initialization
>       wifi: brcm80211: drop driver owner initialization
>       wifi: marvell: mwifiex: drop driver owner initialization
>       wifi: silabs: wfx: drop driver owner initialization
>
>  drivers/bluetooth/btmrvl_sdio.c                           | 1 -
>  drivers/bluetooth/btmtksdio.c                             | 1 -
>  drivers/mmc/core/sdio_bus.c                               | 9 ++++++---
>  drivers/net/wireless/ath/ath10k/sdio.c                    | 1 -
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 1 -
>  drivers/net/wireless/marvell/mwifiex/sdio.c               | 1 -
>  drivers/net/wireless/silabs/wfx/bus_sdio.c                | 1 -
>  include/linux/mmc/sdio_func.h                             | 5 ++++-
>  8 files changed, 10 insertions(+), 10 deletions(-)
> ---
> base-commit: 087c142b2b04898c897aa77938d05a93907150e5
> change-id: 20240329-module-owner-sdio-abd5de3f1d74
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
