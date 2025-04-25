Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7914623BD01
	for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571340; cv=none; b=JEzz8WHB+o3dWB8J+SCEM/ZARywXl/BxhtsNjWCOyEQmN8wgIuJIGJe7pfcDPT//AlyYDk+g5gZm/kKFf5NRttkqsWXOda0xvau+eysmYPbaIDOtahl7DAySvdFJdQWKnCWd2pvJuuI2ADZxaNpX/18pr3Y6xX5rzq/aqhjJMZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571340; c=relaxed/simple;
	bh=yO1N7q1nXmdEytuVzH/H9GOfUp8zohzbYVr7ticuj1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5UUk4wWqjtBoSAvRGln6kZ9vcmca4vJBA1xdZeUFRZrcmurr1CbmL6mZ6XVFe7QdAip+rA8hwxWnIlFBJS86BGPtYDFsDWmjpNsrxKxX+DZFeQrGy8kXLgTbnybRcDy4N20waL9lTRyz+8A/JDEFHrZQGn1VYUZiXFyYK/pj2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Bi+xE+KC; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Bi+xE+KC"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b061a06f127so1291377a12.2
        for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745571338; x=1746176138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OExy8sLSrgvVCUmAwXcFuSjWTxfcCVAuIO4FJVxyYMQ=;
        b=Bi+xE+KC3x3EFM2Kc7vHIScXkCgglddj54M6855gpD+Mkzu7csKMU2ZTbkSPgOzB4M
         aFd7IhLn1A9zrgNwP/MYEIP3vAwyeQQtmgcCv4wNEQHshTbsKh4sjuKd1h8gdgk0r8bR
         9t4KzJANg7GWIzJsz65aTw2YI0bQu/spnCRW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571338; x=1746176138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OExy8sLSrgvVCUmAwXcFuSjWTxfcCVAuIO4FJVxyYMQ=;
        b=Wf4/MVbxum416HXLRfw47o9pbZFmcQ0t0KeziN4zZ4sMcD8VgdCyeYlSLIp1VqthNC
         pxZwEJ6eEZ/3UpmLJ78X+ZTcq+gLQeVKIh0hx/3FwvpDIX3+AM4r/do4GbcW3qn3TbKE
         aL0liJVBO8Owq3+G23V1grAaAzHXqhfY2qJyBMuWSUf8ExPlQv2tMZnmfVdIEP90D84o
         jY1gSeZvCnmY4ArDzatA/90cYuw/GoC0IzGpS3NXgPJ06+iabI+ojnWK17QYRV0Qlqpp
         55sv91RaGn4L8lgDcuJhmLySw70nUdur6D3EYv3A4biz1oaongu3Fyx/qopLE6b2tfrb
         m+fA==
X-Forwarded-Encrypted: i=1; AJvYcCXcqhrmGNSrdHYj3UxmFnhxw2xLZrs10o6uCYkwxakF9OdY+q68vVD8YI/rmK9A4kN0aLnx3bwHDLQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBe4lYlH6EsIqCNa2vOtZ3f+pT1jwISX732tFbTYWc9krvAp8G
	7M4vqTHLTF1GMsAIHUie+aH8TGrnORJuFYwTEiNctJ02ayOfkb7igfe40BQC0A==
X-Gm-Gg: ASbGncuZtZNWC3x+SGGUUQqN4NbvzBb14GrihS1yvttkc9n4A0TuLyJF5/SfxT8g5ho
	/t+8nrKcuitahRd5X7cEdxkVDATYxBGHefvKizAMP9lifU2/y53sdn8KMTBGjyBPnx2NXcZtwZc
	HwMg5fhL9gtvLIAMd/rL/JmSXPHVfajzFzNOh6E35b8iDjaTn1g4gLpIwGGdZ9ZoVrY68+RBWiE
	6VqxflOVlNV9oVCdsoXHlv3DUsxt453I6tNnacD2JwytjRn+q20VG/uPfOnszwPVkEbhMABvOI/
	EXExpHLEfHg6p789h/6fKZSf7D/2NcTxiBkcKVph3LUt5yfN/OkpVVaC6JOXe0MVL+ng6pSDiKe
	km8FOvboYdf0kb2Y4OAQFd2Gd/TEOcA8=
X-Google-Smtp-Source: AGHT+IGy9424wFQXc6q76hRX5u3bEVHS+OQ7YL5gz6P4GiK8kBGxJsLEf/ZcJDGl3WryIX9/E6QsUQ==
X-Received: by 2002:a17:90b:394d:b0:2ff:5ed8:83d0 with SMTP id 98e67ed59e1d1-309f7ddd554mr2845768a91.16.1745571337774;
        Fri, 25 Apr 2025 01:55:37 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221943sm26988875ad.249.2025.04.25.01.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:55:37 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Ting-Ying Li <tingying.li@cypress.com>,
	Ting-Ying Li <tingying.li@infineon.com>,
	James Prestwood <prestwoj@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wireless-next v3 4/4] wifi: brcmfmac: Fix structure size for WPA3 external SAE
Date: Fri, 25 Apr 2025 10:55:19 +0200
Message-ID: <20250425085519.492267-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.43.4
In-Reply-To: <20250425085519.492267-1-arend.vanspriel@broadcom.com>
References: <20250425085519.492267-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ting-Ying Li <tingying.li@cypress.com>

Add pmkid parameter in "brcmf_auth_req_status_le" structure to
align the buffer size defined in firmware "wl_auth_req_status"
structure.

Signed-off-by: Ting-Ying Li <tingying.li@infineon.com>
[arend: adapted path to apply to per-vendor variant]
[arend: added kerneldoc for new struct field]
Tested-by: James Prestwood <prestwoj@gmail.com>
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
index a3243b940f10..08c69142495a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
@@ -48,12 +48,14 @@ struct brcmf_eventmsgs_ext {
  * @peer_mac: peer MAC address
  * @ssid_len: length of ssid
  * @ssid: ssid characters
+ * @pmkid: PMKSA identifier
  */
 struct brcmf_auth_req_status_le {
 	__le16 flags;
 	u8 peer_mac[ETH_ALEN];
 	__le32 ssid_len;
 	u8 ssid[IEEE80211_MAX_SSID_LEN];
+	u8 pmkid[WLAN_PMKID_LEN];
 };
 
 /**
-- 
2.43.5

