Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D0A74E11
	for <brcm80211@lists.linux.dev>; Thu,  4 Apr 2024 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712223094; cv=none; b=rWW3GEJMc/1f5HmFuu3ElvBtpRexlLOwz0lI10xSLxS+Z9H4A4Ao4i81drm0COECjmbaYUlngsInTBEZ37y4SnUyB96YhJDC1KOAPupjX/MeL7dJWBaorstNB78BpCY7JZfZsXdKvHh8ygw9hWaKhVqnUeiHpakebE9HLVs5n5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712223094; c=relaxed/simple;
	bh=eal+hbwuJR0GkxwgPiJg2NCYAvGM7tKiSJzcHq0j6dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GGDu39kOOYYBTrgxVuEEeYsSH9NqfXMNATNNl/MffW/sO7CBxulMij+aD6K64wo2qV6NL802O00WeB8dPfbXtmV4kc1xHSOSq9gjJ/rGarkeG1cg6OjQcE2qn0QMciCWyAuylcxB9N0ZNT50RA3/WWEcUYctE+5T2CpuLf4ntt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A5tTMTPy; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A5tTMTPy"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so883057276.1
        for <brcm80211@lists.linux.dev>; Thu, 04 Apr 2024 02:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712223091; x=1712827891; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QJzdwgYqSiXBG2wAbt+70V3f0hLZ0hXphRY5qJD39hQ=;
        b=A5tTMTPyfmn0zj0WbJeWsZ6FpKAh4r+0C2Ao4DgzE0nNlcULI7aDhTQ2u/dQlDd2nW
         d2pBjgj66bLDYxL7H5EpMdi7py91WZH/ScpTaZk32wDmN/AHtQCvm7hw80hbPuXhBlEb
         cKCUa/1h+98CKXitKq9WS3upcThg7Om3oN0Rnr2r/XHyfrzA99BnQ7R72j1nASJq7prm
         9DjNWy++wKSrX9cAL9gUezSnqUHHXQ7uuDP/0PU/vZjpSGw0q9dqEtDHWs5ZDnSE+bLC
         KDvf+Qz1V/1eyhPqA8yLtiCwyhXALd4KQDQaZJdi6tbJ2tswNwjT+eYSvU4vOPoDe/HY
         wiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712223091; x=1712827891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJzdwgYqSiXBG2wAbt+70V3f0hLZ0hXphRY5qJD39hQ=;
        b=BMj9z5l6wj7RP/gCLFbVwaNA8G+LYRuRjvIHdcq2CwV5Sy/WIE32eZgY3tjS3dgHmC
         5lOnHqxW+nSVfH8+ny75G+lKIpC5RWXKbYImgiLn2PJWACizewOSgPlZtcg8ceFVdyF8
         dK6IlurGyk0/8EDJkc+WQB3t5BidAF1Q5ywVVeB5TB2CflAJtsqMoInxz4HDLC69ahY1
         cokYVV8oESCvrI9Qq0NjIAHWAQGM03LqeWuH2+yEk9u9gja7Ic+3j+dPGZrqQ92ejXNE
         0Wd7P3kIF/m8ggG/mUVgvvre0CEqil2iESOBWwa4Uha8WLTb7VHH58m3PVXPJqCQ71ZN
         TjrA==
X-Forwarded-Encrypted: i=1; AJvYcCU5ukfrkosvPeWQLkl5M3hIwvOOtarfQhOQ7qNWHJtga8rGnds5vN/jH9rWJi7Faa/OryIZQZ+aeDUUaUVZmLHn1Xq3LdCOmp0E
X-Gm-Message-State: AOJu0YzAxezgJHGZec0ct5FKT0bcf6ftMHFMeEcjFUAkcLkiky/tENV+
	3ry0kjbHFUzqyKiDmA7z0mnqLxzjhbFUF4rOiVK/QcIjGfqMO5HbV622kKOVZG2DUNh+YFHpSXP
	nJi55zKIa4KN/h711rRGT1EfZvRgxgKxpwEnWmA==
X-Google-Smtp-Source: AGHT+IHTXtbKZV4PRrgxvlL/R1tUqcSFTjPcwK6//feDtYUO9NjrShijYYET6/+oeV22B9HIEQVjv5iZuw/cw+hBGTs=
X-Received: by 2002:a25:ac04:0:b0:dc7:423c:b8aa with SMTP id
 w4-20020a25ac04000000b00dc7423cb8aamr1828891ybi.12.1712223091503; Thu, 04 Apr
 2024 02:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240403-module-owner-sdio-v2-0-ae46d6b955eb@linaro.org>
In-Reply-To: <20240403-module-owner-sdio-v2-0-ae46d6b955eb@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 4 Apr 2024 11:30:54 +0200
Message-ID: <CAPDyKFodTh-KN+=b1B3V+7aNEoR0SPo5-xjFaWu=gYEtsDy1pQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] mmc/wifi/bluetooth: store owner from modules with sdio_register_driver()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	Brian Norris <briannorris@chromium.org>, Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>, 
	linux-mmc@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 16:17, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Changes in v2:
> 1. Add "wifi: ath10k: sdio: simplify module initialization" patch, from
>    my other patchset to avoid conflicts.
> 2. Add Acks/Rb tags.
> 3. Drop applied SDIO patch, which was the dependency for the rest
>    cleanups.
> 4. Update subjects according to feedback.
> - Link to v1: https://lore.kernel.org/r/20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org
>
> Merging
> =======
> With Acks from Kalle, please take entire set via mmc/sdio.

The series applied for next, thanks!

[...]

Kind regards
Uffe
