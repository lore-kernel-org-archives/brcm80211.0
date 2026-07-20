Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FC42FD69E
	for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576954; cv=none; b=EJCTU3Ku/dPI4K4RkUgL+ldIAlZ5SjJTLadhOgJu5+l3/4bZHA+QBc1Cniu0l+R5K4qhc4y7Y7Ys3X+p1zifSxdu2riv9PLPRlkHkzfEkQXoavflHWgWLrZhPDJQGswCvcRk+netzmGjPL95oRxTYgVGK1HPhFPdbMvhGIYMqTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576954; c=relaxed/simple;
	bh=Q92lWuMn3xKdUx7myg0r7cLEvOzGhk924wJFAIzX4Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrSK+/iR29+yo4PZZFPd37k8GXkCex8AiK7JvsSxwZbpA6k4SupoJNFpljZILP19vOm93McAOO3MfCvpUI+19NtgT7S1h8QYfZQNezGDKe0OaDohgHk9ZFbeqhDm3bKyApRWC0e/7xPjEwa0vN1g3CP+2K2P8GuKf7fcjA2BuvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PCkfEiZ1; arc=none smtp.client-ip=209.85.222.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PCkfEiZ1"
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-9692373e0b1so2005365241.3
        for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 12:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576951; x=1785181751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKqBGdGQQX6H/zEdNMKQSXypwrRgUjHCTJhDmIBT1A8=;
        b=UmQWiTuEZ+86nne0Wxj9uCyrPwHzkru6Go/qF+CYb5a9sCsFByrOA5nr80CNZPJsxp
         +Mbcg5ow3nEVzg5YB+hisnEUcf77mXxh0fvxiLALNw9yrBIHjht9x1fpiN/lbnPJmDOL
         rYdKwHxn7URNqwAVc5A55nEeKSvqpRZhRoZSG+l+Nv6d9AIEu0ZD3HZ3z6yvYskSa1kT
         MgiRHyVciHdnOYVPY/Tm6nzJd3XgH2nni/KpfqTRoRUKmZHvWEh/98GUq2z0xyjhhtLR
         HhREfc7e4a4xTaFmEvl5AljqskhgE0bFXqMvbAdm1mdnxByvJ0NxZQK/naihukaIx0TN
         LZjg==
X-Forwarded-Encrypted: i=1; AHgh+RoY2aX6+DeRG3zp0K2qcDkBw0gTEgCdxPcwPh1Nx9FNLQE+H6PkBzxvCabHSComIzSkWg3n+2Qtafs=@lists.linux.dev
X-Gm-Message-State: AOJu0YykKLhAIwaEFovp/Vm6uXK/RAP8sS1s46CfT9uE7uP6UA36gsQg
	rjPKN9VNTNLsp9h3cat8PRE+0Uf24dHM/kkW9liy2MrI8QhP2NoUyq4IqhHuqiJEMYN/wTtof2B
	a3hs/UI8fpOP65NJqrEStvzKqrAma7tMvZT8cDoXsf9LzuFlfIMcUtT2i1oAWRO1eEmlQ+Fz6Oe
	PRTXr5hgoqJA5W5Hn4hzy8snoXx08bTrsZQsTwjhjWwsGwUzdA1S41SXZhvDyg+bwYEnpW5B7GB
	NdYkP2WM9IQVSn1zUkSXg==
X-Gm-Gg: AfdE7cl/Prxa3SpHNbExkywt4Glb8cnpXmh/QEv/TcOxOLJ2GUHr6pc+PHjWRcIzPwU
	E4m3sFEBwZNCZLcoGPUM/yc+FP+F9Y8++obtSSEQRy3bpQZiO+WeZpLkP0E7gnGM/ywLQG9aItv
	08jjbqBRQQLGUuBk6Ec0mks/+Y/x8C8Rb0+BC4A2GO26WuRmg0JNJQgCHvThJGzrioDO2vtCCXZ
	W8t9cCe6y3h4GLBzuQo3ye/e/BMT2XGGdrQWOZMH6GBVOV6wk8K/GZgrX+4Q2EiBru1ZoEXnJEY
	5qKjx+YskyIbJtyKgWv7jM72F7JeJwcUXHQJ+oaQwPrDEEI8JfhWzDAbsDtz5EvmcK3kVWkmytx
	l8P/xAr6Kp0sRAUmPWycC7+oVlHXew6GdU888i2FiBwCDUMLIfoOFM0I4CftNdH3LxByAnYEMif
	cXTw1V7FA8f3YDYc4qkourSz1/fMRgiEt0QQdQcmA=
X-Received: by 2002:a05:6102:54a2:b0:73a:322d:1bbc with SMTP id ada2fe7eead31-74753751fd3mr3990686137.26.1784576950924;
        Mon, 20 Jul 2026 12:49:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-74758231d9asm887313137.28.2026.07.20.12.49.10
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2026 12:49:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-698557ec1e9so6298236a12.1
        for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 12:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784576949; x=1785181749; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKqBGdGQQX6H/zEdNMKQSXypwrRgUjHCTJhDmIBT1A8=;
        b=PCkfEiZ1dVCes0dMZHysjpuAKFNmjyVwxK+egfu6Y0z8Q2OgNVP0S7rxWAfeT0/WTX
         lD7fbLwtiLrwtlfjLmZ1MlUFccFl9Xb/utybujGmeP1oTqB8VnNFH227Pn9PNlvtnqJL
         BallkRMDlDAaeoHa0BtLn+XD+RB6lOpHJhAFA=
X-Forwarded-Encrypted: i=1; AHgh+RpzelsskFgrC12//WqMJkLJEYvTG5pVBdtfh/G+TtzQ8Qvr8ypabvTdqtaqV3mfU1gZxRBJo/f/BfQ=@lists.linux.dev
X-Received: by 2002:a17:907:c896:b0:c12:6ad6:6398 with SMTP id a640c23a62f3a-c16b4854d08mr545722966b.34.1784576949502;
        Mon, 20 Jul 2026 12:49:09 -0700 (PDT)
X-Received: by 2002:a17:907:c896:b0:c12:6ad6:6398 with SMTP id a640c23a62f3a-c16b4854d08mr545721766b.34.1784576949094;
        Mon, 20 Jul 2026 12:49:09 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm506543066b.14.2026.07.20.12.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:49:07 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Angus Ainslie <angus@akkea.ca>,
	Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>,
	Wig Cheng <onlywig@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH v2] wifi: brcmfmac: set F2 blocksize to 256 for BCM43752
Date: Mon, 20 Jul 2026 21:49:00 +0200
Message-ID: <20260720194900.2356442-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715-b43752-f2-blksz-v2-1-f9be49856050@gmail.com>
References: <20260715-b43752-f2-blksz-v2-1-f9be49856050@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 15 Jul 2026, LiangCheng Wang wrote:

> [PATCH v2] wifi: brcmfmac: set F2 blocksize to 256 for BCM43752
>
> The BCM43752 is not reliable with the default 512-byte SDIO function 2
> block size ...
>
>  1 file changed, 1 insertion(+)

The stable backport explanation is clear and the "needs adjustments" tag
format is correct. The one-line fix is trivially correct.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> The BCM43751 shares the 43752 firmware handling and F2 watermark case
> and may need the same fix, but I have no 43751 hardware to verify.

I have a number of devices but no BCM43751. If anyone has please try
this change and let us know.

Regards,
Arend
