Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A821DEFE5
	for <brcm80211@lists.linux.dev>; Wed,  4 Sep 2024 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725464969; cv=none; b=OMEhjonkMc+efCFWk1KzhyWfENt/ryY0KaVs+h12zFxfKE5PmehZHrgduJRFEQTjdnAedW7KqOekL6WotZoXLXEiaiprphdmMAJKLsn8TN/jADFWf7A0PirqCgqO6KWc0hplxa6E9k2VbuvorEz42Es0rX3448xjXIY7Dd6Bei4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725464969; c=relaxed/simple;
	bh=uOyPjGt0jQt2rh9a/QIkYjsMGeW+O2UMFkZJfXzINs0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j0uwlWwFd0BQk0XJygcKvyYmzaCXZjXSDwDKQJVMNWZJvSXenXkDpltEjJRDz0Oip8xwVdJOsrMBNR3oYHqUzoILYEqykEn/uTq8mfzoFEL9nJxFPYF0m6YgM9r+VjkSZJDkCUf1bGtYB4f6U5z/xo1REPZxMHgBK7CM8UH4zkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRSQjXIt; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRSQjXIt"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8695cc91c8so701458466b.3
        for <brcm80211@lists.linux.dev>; Wed, 04 Sep 2024 08:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725464967; x=1726069767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNOha94p1Pn6xGxE05olLPJMp0FKiE02MSaHBlDjyGc=;
        b=GRSQjXIt2+QNuXo9VLHVSdZW99mxVuUN9TEq45OztcK47YBU76IkUpOt/bUC1tTSMW
         Wh+6FZcW0YZj/Jikbt+ZYWsqvFwYI/TpspBynPTzIdSf3pLJuW9IZ3FfCzWTu28J2Hg1
         0rOu4ZSIWpjTNWNcVakekxUea0uCZ4hxg20TYi0XeJzsGax+045k3TwR+WegxLIIuWqd
         JMI1G6V4UX4Ku4DNCeb7Dsxy1Hpjf9Z5QKIBk4yigsCgTfHj6OwrSEUKGqQECg60a7a0
         ++ZZxu/K18GyyDuzTfNJjffhbjLovzt591G6/2Cx+OGElSe/VSwmhYpu6f/JdVdTTEtR
         5obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725464967; x=1726069767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNOha94p1Pn6xGxE05olLPJMp0FKiE02MSaHBlDjyGc=;
        b=c7gihoYla8YEAuYt8WqYtcxorvM1j57vGdcDzmnjfTo3HhFppVafkU1ek6fib0qkbQ
         w8zVE4jl/dQWeSin10L6bPGHrxIizB7S7Fqk17HQlpGXYpZTjUWrjkNFhCgr7A+NVcxu
         f3jAIglU3UhDL5smMfe3s3am3taojgeK8W4mtEzHp0USYqqWXzerKz6TTBrt7mYGgB6C
         OoEH2U/q4MGWMjaKXaycp6UkB4qX2AI6zRZF0+Hy6yfrWihyDopFlE4D5YJ3Grcw/FU3
         Ouf/zgY6tWCM/OGKJn15J1MhN4xvC8eg8I03/uulHq3eqp4GmvYurtdyDO0ULH2zNStE
         2ngw==
X-Forwarded-Encrypted: i=1; AJvYcCVMTrIXj2l8LGbKxBNhR/u1jbigCfFNpESqPqc8aegPavFztqYm59foGQgGdVZYNE4KE66SkXcOOd4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZToMj/bmAELEyWmvnePQuCa0uc/UZfnOlOnzYxC+mC9JynzSP
	2PC6MJ6Z7JlJblr5RqvxfunT2kxIH79MOi9i5ZMEYNfXMOBP9kaS
X-Google-Smtp-Source: AGHT+IF+lxhGwhoMZYoepfp3gDH24Pru7uRsX8Up7mCHlBWZAoA5jp5kJqxxNCQetwbSZCOVjPziUA==
X-Received: by 2002:a17:907:3d87:b0:a7a:ab8a:38a with SMTP id a640c23a62f3a-a897f8614c4mr1423708966b.27.1725464966572;
        Wed, 04 Sep 2024 08:49:26 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:2f85:317:e13:c18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a62038c0asm7825566b.62.2024.09.04.08.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 08:49:25 -0700 (PDT)
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
Subject: [PATCH wireless-next v2 1/3] wifi: brcmfmac: of: Make use of irq_get_trigger_type()
Date: Wed,  4 Sep 2024 17:49:17 +0200
Message-Id: <20240904154919.118513-2-vassilisamir@gmail.com>
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
simple irq_get_trigger_type().

Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
index fe4f65756105..e2611f164fa8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
@@ -138,7 +138,7 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 		brcmf_err("interrupt could not be mapped\n");
 		return;
 	}
-	irqf = irqd_get_trigger_type(irq_get_irq_data(irq));
+	irqf = irq_get_trigger_type(irq);
 
 	sdio->oob_irq_supported = true;
 	sdio->oob_irq_nr = irq;
-- 
2.25.1

