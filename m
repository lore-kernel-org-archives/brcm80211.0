Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFF11DFE2A
	for <brcm80211@lists.linux.dev>; Wed,  4 Sep 2024 15:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725464971; cv=none; b=bG6e2RXAJVgh6fLGCNHBzbkFCQEFm3XpdZFe2jbsmBpAdh52bpzj1dMC7TS4HjLwc12w1+9FETwb+MbDg90iHO9YwWiToaVrI2B2x5gQ8nbfk6LFpclxkw7FF28+YePbdN8Blf/SZtiDePv8dcDKDidVdeFmTMpuqgh8CllJE68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725464971; c=relaxed/simple;
	bh=XPXzxmxPuh0oRaEz8t/+d+iASKVe9XfXqjCyTenSPXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hoPIa7IEAEycmcmHxC1v5RV5fXexSsc2ES2wN0tpldL5RyIdefj6rOCOugh0N/Y7kTb6tUlo/KRAaOZ270hu+3dMDDR+uoWXTzQ9T1nw6eJOvj9WOfDlnhoy4FH1BFJ10JgDAdbBgH1XurwjyFwGY+8F9d6isPVadM/Hf36f6m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EU8iwABP; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EU8iwABP"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a86859e2fc0so773131766b.3
        for <brcm80211@lists.linux.dev>; Wed, 04 Sep 2024 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725464969; x=1726069769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBEQBp9g3k9SiXOvyYlcXlhKd3Urb0xWdAtZQorxYxM=;
        b=EU8iwABPj/HPZaG3iMKDLBMn1mYP7zQLnxN/Ss5F260U/s22VCzRXVkFv93u9e7RTF
         2+fE2mD9QkiTtTkvMU+CKPvLFRhYp6VF0IAmNFcSTUx4fXcVCXDBaxfMfgNXsiZ19Rbl
         27IQ8oIE89hp1suxsU3h/m5K2RZ3EdxJ8r51wg5ySrbwtZSrWrOsj2FhNdxcP4Npngr3
         ZcaGMajJKDnHSLzI/ukSRecddaAS1g7pkhGGBhXL34YWfPORBOJqWFhvrj9zIFPFVaSo
         UJg5MOSz/00oVpqjircbeETTXB4K6+lv9AbeF/NtSzcgx14BvcdwC7bvUlv2uFMMxUMu
         WtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725464969; x=1726069769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBEQBp9g3k9SiXOvyYlcXlhKd3Urb0xWdAtZQorxYxM=;
        b=qEaVZOSdXcyiiROSlNySo1ieFVbJmAAE9J+jRCspDdR6k8ZZAqiPx32GLPAu8NAelz
         bhH8vx+tKlrhAeDGWA9/pwi3sY2JeMQ41jOCBegS4AQqpu8XiFrNzXb3oadoHVNczKSc
         XJkN9uWFpns6n9h1fim58ZVwPFnSaoaSwVpA0dRuNabwASFQpB6cfqYXIVOvWLtTm7CN
         REdU/e/6D7Fyw/6M7vkMqthq9GWkRnBW+CvZO74Jg6XN0lYL2jbtwb1Lxw2dsE/UhSpz
         4H/1/IW8ib94UWeJaiwS+IMaSLpBtMgwAOhgU0PASek7dhFebdg4tSSHoV1UUEjqBZSE
         Fe2g==
X-Forwarded-Encrypted: i=1; AJvYcCVpBeFM1bkauIWBolsDtWT2a/HiQjgGaeHne5XMwv8SHlfjh9jEJY06kywpV7+gD4E0ycLoKkfNnGI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+Vxs9nYXACBb8Ct5mJXtNWrobPhy0eMx/vp3VVQqK1cheovjz
	Fu24Nk+AMJ7YKKWt5JwRP2LpD0BFo1eyfgb7i29oba/PNVRfI2j7/GSbR82L
X-Google-Smtp-Source: AGHT+IEdYRPw8lVb/idDkI5zThZomh9D+3QQoM1QCPI8EglGvkLtHPnmv3rRaWQPScsdO6vXDp4SVg==
X-Received: by 2002:a17:906:c102:b0:a86:92fa:cd1d with SMTP id a640c23a62f3a-a8a32f9f1c7mr393319766b.49.1725464967741;
        Wed, 04 Sep 2024 08:49:27 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:2f85:317:e13:c18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a62038c0asm7825566b.62.2024.09.04.08.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 08:49:27 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: arend.vanspriel@broadcom.com,
	kvalo@kernel.org
Cc: knaerzche@gmail.com,
	leitao@debian.org,
	linus.walleij@linaro.org,
	javierm@redhat.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Vasileios Amoiridis <vassilisamir@gmail.com>
Subject: [PATCH wireless-next v2 2/3] wifi: wlcore: sdio: Make use of irq_get_trigger_type()
Date: Wed,  4 Sep 2024 17:49:18 +0200
Message-Id: <20240904154919.118513-3-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240904154919.118513-1-vassilisamir@gmail.com>
References: <20240904154919.118513-1-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert irqd_get_trigger_type(irq_get_irq_data(irq)) cases to the more
simple irq_get_trigger_type(irq).

Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>
---
 drivers/net/wireless/ti/wlcore/sdio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ti/wlcore/sdio.c b/drivers/net/wireless/ti/wlcore/sdio.c
index 92fb5b8dcdae..9e1b644beba9 100644
--- a/drivers/net/wireless/ti/wlcore/sdio.c
+++ b/drivers/net/wireless/ti/wlcore/sdio.c
@@ -324,15 +324,13 @@ static int wl1271_probe(struct sdio_func *func,
 	memset(res, 0x00, sizeof(res));
 
 	res[0].start = irq;
-	res[0].flags = IORESOURCE_IRQ |
-		       irqd_get_trigger_type(irq_get_irq_data(irq));
+	res[0].flags = IORESOURCE_IRQ | irq_get_trigger_type(irq);
 	res[0].name = "irq";
 
 
 	if (wakeirq > 0) {
 		res[1].start = wakeirq;
-		res[1].flags = IORESOURCE_IRQ |
-			       irqd_get_trigger_type(irq_get_irq_data(wakeirq));
+		res[1].flags = IORESOURCE_IRQ | irq_get_trigger_type(wakeirq);
 		res[1].name = "wakeirq";
 		num_irqs = 2;
 	} else {
-- 
2.25.1

