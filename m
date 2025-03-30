Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CD917A2FA
	for <brcm80211@lists.linux.dev>; Sun, 30 Mar 2025 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743329349; cv=none; b=WvgdlLcB/UcoTsyLu9gLhDtiA7UKwgapTKeROyRpV/jl3b3jKNBNGHG1kbDrTHtjvJsHKGBvt3DFjawuIOqKYTRhSblIwVKhMZRnrxyRrECGkZrWSJn3xo2XbALH2ku/fDjLJL8Aqve0ExcfNXCwFP7t/O3IF1dtWXOlcY/S/+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743329349; c=relaxed/simple;
	bh=eZoDJbEllHkfwON8TzwlFyRaZAybs6sJMtNAq5+2UQ8=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=TcijU/IkRaTTUW/nqg4tSkE7MwbQFCSaOaD1cr/N+o1xG52Eqe7s+FKFakPpO80Y6BE4DhAA10l8jIhJYcrxbOcdv9Jcto0pZWyOnIcj4dPyDz+dY4z63aLuZebarC7V4ab7sqNa3YyUNxt2+k4XwQHIPmfEZZRTIXAwT4vwGvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NZAsjI24; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NZAsjI24"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abec8b750ebso564180166b.0
        for <brcm80211@lists.linux.dev>; Sun, 30 Mar 2025 03:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743329344; x=1743934144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZoDJbEllHkfwON8TzwlFyRaZAybs6sJMtNAq5+2UQ8=;
        b=NZAsjI24vePR0vVLc0r2z/w9uVccF5qZ5V2dakVIZLZksfjM8PGdlR7GK2d1WQ4f7o
         HgSvakqwitqZmWUod0Nv3bZZa35qk+K3ZwfKkPk9cht5cGuxL2U7uL/xRJ6+Nl2g5DSG
         vbo8nSYwIb16+lZAThpR2NsDZXI8HQccjqjYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743329344; x=1743934144;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZoDJbEllHkfwON8TzwlFyRaZAybs6sJMtNAq5+2UQ8=;
        b=Blfs8XeHNupKBCUl2MBrUpXBRI8bsNRivJOo7Lih/wKLn1Wu0nQiT3JiZUY0xq0UCT
         Ohg7FyCldFn/QguYFDZ8bbyPcRalEEslUPngkGht8mArac8Iq9YOe5bvUCohyWVXD5QP
         9MsaEbve4ZinMpymoaJXqa8xbIDWgxk7ifWL2J8Hf+lbk36J0GjAOMHp9npOsUnHJ0qx
         SH0Unrrebena8OPW9VrasdvOFNcdcFmtYfXft13pqE4F3MJUJPAi33fTQbcgOEiTO0Ku
         wB1cwhJ5d7gdZdKJ0gpIjKA/FskiDVAoIXJAHOxjdIYsZHZURNESNbcgdhKIZikdVQuJ
         msbw==
X-Forwarded-Encrypted: i=1; AJvYcCXwjIFy3YnUk1N0pDFzZmSk/bBVgEIrsx7NNtluSmnzenHHwD/D3MDzrSzI4jozAYynwiQ/wytphwo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIwLgJceZDeOiHC6itC58S3h/d9olycIqHKEix5hyM/MoSZ//y
	2pWp+SwR35H2+mXxfzBkT7kBApy7MCxuyI0nj7MvJZluc9Tkh97WE0BpmavutA==
X-Gm-Gg: ASbGncuRzBJ6qV8dzjulIleR7ZnLLl6YmlvuEm44/cpPUCvqbgX6i8LbMaIZuEc0sep
	HcLgdZDt4EEjENWh7bscQpIEerVwBAKqvREgFmyMgg26qXosfHyHRJTs2XVst7EcvzZT0rVpX56
	oObZMdZOvVIkpwYjyEdYWR3oBXrGTWu2jGsusYOa6SoE84F5MBfJ4lqkSzXDYbrQznK11q+BW0G
	N1Xvcyo1651rY8PLYzph3F6Iomuh1xLAb8CNu0u1irqv7KOLCm6KntuG7VMKAssjeS4zSbj+ChE
	pexI+QiLzyY0Lc6RBN3Y75Pm7FYN0GCnQ7pTwkxh/Zf7HsYVjcXDp5s9wRyBSZi1VGqrK6R/AbD
	EGmdvCbnJ+sMT/siURA==
X-Google-Smtp-Source: AGHT+IFJg4kUKiyT2B8lBy3TjPqrtF5fy65If7k3hF0Wr+PA0SEuX6wBhW6uPj6N1vgCiAhCTdyeDA==
X-Received: by 2002:a17:907:94c6:b0:ac2:c1e:dff0 with SMTP id a640c23a62f3a-ac7389edb44mr421471966b.19.1743329344359;
        Sun, 30 Mar 2025 03:09:04 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm450485666b.160.2025.03.30.03.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 03:09:03 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
CC: <kvalo@kernel.org>, <jeff.johnson@oss.qualcomm.com>, <toke@toke.dk>, <jacobe.zang@wesion.com>, <u.kleine-koenig@baylibre.com>, <megi@xff.cz>, <sebastian.reichel@collabora.com>, <saikrishnag@marvell.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Sun, 30 Mar 2025 12:09:03 +0200
Message-ID: <195e686b618.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250330093505.22370-1-abdun.nihaal@gmail.com>
References: <20250330093505.22370-1-abdun.nihaal@gmail.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH] Fix memory leak in brcmf_get_module_param
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On March 30, 2025 11:35:41 AM Abdun Nihaal <abdun.nihaal@gmail.com> wrote:

> The memory allocated for settings is not freed when brcmf_of_probe
> fails. Fix that by freeing settings before returning in error path.
>
> Fixes: 0ff0843310b7 ("wifi: brcmfmac: Add optional lpo clock enable support")

Good catch. Thanks for the fix.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)


