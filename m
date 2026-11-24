Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551259;
	b=4HeSqSOt8ZXHGK1uARJmYiB/IGajTXMv/n+oggXJy+fibGQdPz+FHvHWnJRjkRhgEx99
	 vd153F00zOQA5xiPv+DkbKe+55sfzEv9iASegeB4RLe4xrtvkGpnVvk3PNciJLisjVzyE
	 vX+rcBUNhRdwXFZdz2kHd61Cp8Lmg4vorKjGjsahdQmtr0a1sN4pQuPl22b/3XyzULjEl
	 zE/KZR1B9siL2jNKELsYVOlcjglUnz/HL+cPvOTXl57C5PIQlqmv2mFnlo/KeJ/Fci19+
	 s5cjw2GO5SBheCTUDdCxrbBWRnY+4J2Vz/xs+TUZfHP5aHKarqeTFCut5HeGFAs4s4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551259;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=twk8JHdUg2LSIv8pIS4vKgK5KN9CfO+IKyyNnrXVF2k=;
	b=1FOQdJ7oXPgb//dxp8MketoB9B90+wDuCpOkrxpNOAHGbWZFjA5iNqE7E562oXrwlTz4
	 HzddxkMr01qNX4Km0I+rqoOqNs6DOSJurXTd2PUUtiEWUhO3Xx8uBpdd+ZxglytkRqsMC
	 j5S6Ov18G6SkkG49BFxwKlxHIW0/BbbjZSOfSxls0YLE7QB845C86f7kTJ69b8S1NKL1p
	 QKOhuDSSnvx0H5b+eeRBgiZbrA551PVXWS6t0smN9JY6O1b/YABTmWP2DdoLGSYvsTYiW
	 KD6FKrupblcr4WFBvCbka8tDSwe/nfQnKKe43W+l1KeLfEZjNwgh5j83MxBh9naD8MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="d+Uje2/M";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB65606A6A1
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB65606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=d+Uje2/M
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so2581472a91.0
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551258; x=1796156058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twk8JHdUg2LSIv8pIS4vKgK5KN9CfO+IKyyNnrXVF2k=;
        b=P6RzpcN7KtsDHA8xnp++S7J+lLd1OwIsDQsXR5hV9n+4Ri3IWXusv7BLhW00Peg6Fr
         SkyeESus8AYaadppnLMEwWz4sNAvEnkqqp00Ty+PP1UXrh1w8bXWzKO8k5xYI97hHi55
         EzNZRwkfWH1e66A9+3esZmYsogFtl+R2rsN4ryJdsnaOAcjQu/fRMr9qI6bGxidWlkHQ
         dyhV+FljnYO8M4atQ/pPtCis4soe+o+Nr8waJsIRo8dTMHr9DAqr+v0GNILCcc/g+2TW
         Car9n5BeU1/6F8srqt3ETEH2WW12SoRtQ4WUB6983xvVDt5mbYm4RhJZ6QzPfTpPGijp
         9c/g==
X-Forwarded-Encrypted: i=1; AL+hErEk3ozqhBwJ0x8asRqchwbhuP9JspXp2OtaedT8BWv0sBiZwvy3IywowhZn0d10cDwXN9ejdIBCD+s=@lists.linux.dev
X-Gm-Message-State: APuU4Z9i0N3le285dCQGkbdKR1IiJSG4TAGNa5fVXyRSxzayk4QVLLLf
	JrXsD7vhVS5u6nJFlhoAGjCzJt+WZqY4Mrt6WYRU8lczFf6gO9+DRC0wLHiqYw/btn0hnLeqS2U
	HC6qeILQSvOfqEHPgcqzepumjMmeg0VjpwixzL6NLOwX4tqUYhVFrOIc+Hw3BKKpDY5g+3snyeB
	0E+mjlrHPnjjpvXfqtvvVDLiSTk2NN7+DybjRgnTcznaVJlBmKtKAYf92LJcYIY0bZ9gWAD98P9
	t5JY6YF1YVA5PUm8EemkQ==
X-Gm-Gg: AZFdTZfa3DJTZDZ/HmZomUFJsNWwjQBe6mtobzShKzGlg9gO/Jbufi2edJ7QvtY+jTe
	0ol0W2VSPuJSX42u4W9WqORpSzZj7QVlPnTx2c7IrjzRjr0HUtK4C39dbxBZH6Ci9uGBwhsY20D
	olArwiyBGe6/EFfSAxVVvsNeYYoJxDSQzrCXq7ovsUF/Cpgr4QPxK0dDlWLU5x3GLs5d6vttO6U
	dOZSCo3DD63dpqE5oydx5USCplcZPDcbBlJ3L4iuWm2IFyaVwkoxFml3vKUwSNtgw/f6Z9OlUFQ
	Y++gHENjdvMKHSVRRXEHoPx9ttRQlbw7ge2oGCnqz+GuxFngjKK7k5iMa51M3mAa39CgfE/8spS
	2orTZ+IirztofJol2vGbOePt06pcL7uuMYCVHUfaJU0UPJ3SGL4W0k3cduS0RHx9TVLnC3WxY0T
	CVuJurEkjw/X8mjupKxZp9PqbPIcWnhyjzhN8Ivm0K7A==
X-Received: by 2002:a17:90b:4b8b:b0:3b3:b9e4:e3ed with SMTP id 98e67ed59e1d1-3b41cb47a0cmr13731608a91.63.1795551257712;
        Tue, 24 Nov 2026 12:14:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfc74bcsm5161579a91.0.2026.11.24.12.14.17
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92179251e32so1903036d6.1
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551256; x=1796156056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twk8JHdUg2LSIv8pIS4vKgK5KN9CfO+IKyyNnrXVF2k=;
        b=d+Uje2/M651fpTSCdXez+vOzj3o1YU0PeOTgvm3ExRTy+9/TJLs/JG1xg6PNt19CoY
         uLRV506PnbznJo5rjNIuffAYAuGsaNXuUCOpKTKgo1duIdy7bozcu/XnZO9evAl5gX4R
         ASNi8ReLu9FTMJ+L86geJUp88cOWa//giNMrE=
X-Forwarded-Encrypted: i=1; AL+hErGC5ITNcIizqpkruMt1iDfn/CEBk9kDtj6Oubl2/QjGk4WITnS7JcuynCNSOmxJpSQompYYlWnddGI=@lists.linux.dev
X-Received: by 2002:a05:6214:2dc6:b0:921:3573:1b25 with SMTP id 6a1803df08f44-92135731bb2mr286489296d6.27.1795551256115;
        Tue, 24 Nov 2026 12:14:16 -0800 (PST)
X-Received: by 2002:a05:6214:2dc6:b0:921:3573:1b25 with SMTP id 6a1803df08f44-92135731bb2mr286488826d6.27.1795551255663;
        Tue, 24 Nov 2026 12:14:15 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:15 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 4/7] wifi: brcmsmac: embed default_bss in brcms_c_info
Date: Tue, 24 Nov 2026 21:14:02 +0100
Message-ID: <20261124201402.3499613-7-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-5-rosenp@gmail.com>
References: <20261111042554.232998-5-rosenp@gmail.com>
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

On Tue, 10 Nov 2026 20:25:51 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> Replace the separately allocated default_bss pointer with a
> directly embedded struct brcms_bss_info in brcms_c_info,
> removing one kzalloc()/kfree() pair and its OOM error path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmsmac/ampdu.c       |  2 +-
>  .../broadcom/brcm80211/brcmsmac/main.c        | 35 ++++++++-----------
>  .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
>  3 files changed, 16 insertions(+), 23 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
