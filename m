Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13545231CB1
	for <brcm80211@lists.linux.dev>; Mon, 14 Oct 2024 23:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728946925; cv=none; b=SkP8PrgKbp25NYHDH44bjPkDwB1H9zYrmGrt4/qbT7QMkJ5gI+TA6S3XU4NnNLf6R6PKz1YF5JuhxO40c9QzRlTCPpx6QTiuwDi+PZ7k0gwTHYnVwUgdF7WYoUILK9V1Gb8gf7v5mJ2hEisARj8WHz5p5jNrKTLOSgMHC1eRS74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728946925; c=relaxed/simple;
	bh=isxeY2F05qQsZ2WKXbGh/MaxpRRZpflVYsLI4JN7mzA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=s9m9ve3iDSlVs2t/uRHC1cut5yvXMZO9qq4u7Rw8Kgrp7tA2tw9d5mkrcA6JpzUnnN+Kkn7df2uhIYPDpaXxKSIZqMaVNa08mx6cVCvxUg2KWbnzfjma9rafgiZaCsQ+NOkFXZlywAd/SV0c3daguWMaJqhjwYPM9CFBbFpxt5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRji0I72; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRji0I72"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so1198578f8f.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Oct 2024 16:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728946922; x=1729551722; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIkS7pzP1CV8VNgOcTKZ+pJdHHTX/0kd0qi96EfGmwA=;
        b=IRji0I72KKSkIT4qZdnGRtG8uqAoGudtNJ8N4DIzfsutICm6dohkAW+eVA+YRz0pLT
         WbZIRmeBuBmLnZoQ/XktKKYvOQregYHMBPI7/G0V5IDQ0hP2AIFbLojULiP80r09MTLC
         9rSlqlf7xGF6SFvSw03gTRoAPKsc4UntNHnu3OvGjKSBXO/go5kTIQNVkvF2Ss1uEToV
         PAEjH7uFotMs6I9H8TesQzlfMT49FXk1uxSzmlcKUst/5yr2EXVGn5fgh3sJm7uBUZA0
         Bxg0sRjYHYl6zcQT5/EG1D3zYBYSgCO/ohYYVh4r8iLEuJYQ7OLttxDMWzzf6mkGSFft
         FPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728946922; x=1729551722;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fIkS7pzP1CV8VNgOcTKZ+pJdHHTX/0kd0qi96EfGmwA=;
        b=FEtYVD+aRYjtG7UWT3Uk9xsMiCgi/rmqlrxyD8371CTciUbSwJoWo3KBs2pxLGIbfo
         6st+ppXBOQsapwp+Tpcnd59MTN51SGQgkR4fRDgfiTqCKZb06zkV4zqG3zH3yZb1UBD0
         sRL5ibkfcScjWVsqXzh9c3J3FP+TLqK3odfdIB70gaMjADqOh+y14uB3fAf4zQCaF4tl
         S155jDu+/WiV6DFkTA1WGZZFSYJiz1pQvXO9fqSDWKDOz2CTzqhvnGqcOtKERCgbLN1h
         B/AZBcvgz2TmMRAPTsH4ih2T8MGU4k56DTt3NaJIEfhBFD3Bz8WdmgwXFz3zzAa3GSnH
         ZDFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVz7/IadDev0KmbWxCTs7A86pMlLswGytDkCKeMrTgdSalklDM6RsD/CRIX9UpmBV2YkTtKETrd84=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEV4fDM8Bc3PKXchGyR6rPQTuxNSM1XpCt65qKJwjOepiSNKFd
	yjIGITWwRNS5CVs1MEj0AQ+2UiTdKVMxcOz6fLL8XtTr9AnrUhkb
X-Google-Smtp-Source: AGHT+IGtA4bl0vTDiM0+34/hmRCDBCj/NNYNNYyHfcFZcCHzGIIQMEEMETQwN5PfPgRBOylVg4J0pA==
X-Received: by 2002:a5d:4d8c:0:b0:374:bd48:fae9 with SMTP id ffacd0b85a97d-37d5ff2a6fbmr7178985f8f.20.1728946922222;
        Mon, 14 Oct 2024 16:02:02 -0700 (PDT)
Received: from [192.168.1.240] ([194.120.133.80])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37d7fa87c7dsm105712f8f.42.2024.10.14.16.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 16:02:00 -0700 (PDT)
Message-ID: <9c02683d-c688-4e39-913e-6b20b3bd76a0@gmail.com>
Date: Tue, 15 Oct 2024 00:02:00 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Subject: incorrect shift and mask operation in
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Static analysis on 
drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c has found 
an issue with a mask and shift operation in function 
wlc_phy_rxcal_radio_setup_nphy() as follows:

lines 26326-26330:

         offtune_val =
                 (pi->tx_rx_cal_radio_saveregs
                  [2] & 0xF0) >> 8;
         offtune_val =
                 (offtune_val <= 0x7) ? 0xF : 0;

and similar in lines 26376-26381 too.

The issue is that the expression pi->tx_rx_cal_radio_saveregs[2] & 0xF0
when shifted 8 places right is always zero, so this looks like a mistake 
since some value value between 0..0xf is expected in the second statement.

Since pi->tx_rx_cal_radio_saveregs[2] is a u16 value the expression 
could plausible be:

	(pi->tx_rx_cal_radio_saveregs[2] & 0xf0) >> 4
or
	(pi->tx_rx_cal_radio_saveregs[2] & 0xf00) >> 8

I don't have knowledge of the hardware so I'm not sure what a suitable 
fix is.

Regards,

Colin

