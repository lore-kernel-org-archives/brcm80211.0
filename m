Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F312918DC
	for <brcm80211@lists.linux.dev>; Thu, 24 Apr 2025 19:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745523809; cv=none; b=nwEp7uuvwMki6krx0BOMeEszJO0J4aDv9rRrjVIrTYtwGLFSjUJmkQX07YqDbQ7v1yOW96uGy3kOi/+6qUkB6xaNYnJMllK1QBerYVr49u0ZHWlSNIYZs5qiqYimEnGIgKMV+jeGoKUFlqXcDdhakUCwTneTJophV6xxeGPzQsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745523809; c=relaxed/simple;
	bh=xGl64ujrsdrC4dnDMQhjfBUYQlSQajI+VS8adhfAycM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDH5wmfUEifw4RJnUOMnw3LJJ8Mb2ETL1owwVB9FpSBM7RrD2+QPaaK6lpA6+jQCPlxAbH546I9PTqLO2TDid5LG4ARQDUPeEl1koqGnmpjWcjwKdecwQjw+nAgrM0YMQRkTum2OAR/3mLtex2CJQvnVJwJ/U5ZjJJJo0WZ2XBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WIri016N; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WIri016N"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso1943371b3a.2
        for <brcm80211@lists.linux.dev>; Thu, 24 Apr 2025 12:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745523807; x=1746128607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPDEHHnO2E4wWn9hSbYFv0XULhkYtZMw4vPWkP8Y7ZE=;
        b=WIri016N12IwCV63XHr9UfhdhtWGhxw2JazNBQGqmOg54eelDUCFHCmDD1xo5NawgU
         RhfqYHpkSZOhf5QatUbwA1ohUsi81/mQd4JlR4UDoubUlRFWS97IhrbVYIx0IJPdwVO/
         DNSpNNHxg2e6pMlcKfzZeHY3gLFJzYjfPQP2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745523807; x=1746128607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPDEHHnO2E4wWn9hSbYFv0XULhkYtZMw4vPWkP8Y7ZE=;
        b=fAKekxspTbJBqJY9SDlTXeBwKAWjnPlMrjw6n4rF4mqUdOY76nvcE62mY3Vgl13n55
         vGjGnkCh0AUKbc/JRXaxncjLYB2N2ciMYlpK0DjRPpg6seBv0vaSiBNl/ifju98EYHsh
         P4JeWTC8hdLxIVF8SQ+xfAcfZBUYMO8Jifu8K2dnB55bdYHfs/N6iju62cXPBqcNbPlN
         1+xxyHK3OvXwPgcJK6xgcdrpvFpQxnPa0C5xp+PGAtgPyeuQrhitecfHe2kaw+Rc86w8
         Z6iEEK0+pbQao4n0lZu52iGlUcZ1qcOOi24BHY8sbltWrj0PmnWjOk4WdDwYid8Altq4
         sNWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMZLPUx39/dZkji8EMHvw8GUxW0zfBgZgYlQevODJ+HhXsVOiNU9/IILqMTlm9VFS+sSATWB5elWk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlAcRRDlBoUkovEk9U5HtXAQIxuFlUMPTy0Vlg52i/DgT3XTxz
	j7FKFqyxjR1n3gYGyiujO2Atc2cdFBjRsqzAvYaRrlyCe61iBjBqbZJuhXiAWg==
X-Gm-Gg: ASbGncs6U32tYOhg2wAnrCkoequ3KrwiLrnhHIw9oeMhxeIFoQi4+BOXDlrpAR4bBbL
	YqhakCFrEHFnm+Wgpb5Kxe1k//wzTJ2MJ+BzZQ+goe/Tvil46JJDowiZQRPnKeR1CukNUe9pwDG
	BWUd/QztIh1QvS2QVTjaM9Bsa2pMT02QXJt0EHPU9GergCtV1hKu2uRNP7GBNhq/R+qJv+kAF+O
	Uv3wf0Wihrfh7M6LZ6fhIwQIVZiKpuNVC6tPhlS258w+I2pbAR9mWEdCcVKtbC+rxcuU4VUoHqX
	/HmCCrwwrQEsD+fMkSng+fSsY2CYQ0NHH07MsjMmJ3GC3uMGzy58Y1yIlIzJ2bKAxLH7gfrmoUB
	ieB3u8yDuYpHF4YtFoKRi
X-Google-Smtp-Source: AGHT+IGqPV5RU3YRJqKxlFcS4ArDbfyr8689XOGUQmFQZvrizvJi7h0h8dDGGgkj4fVx+2kC/VURZg==
X-Received: by 2002:a05:6a00:39a4:b0:73e:359:1c86 with SMTP id d2e1a72fcca58-73e330d3b0amr1224863b3a.18.1745523807257;
        Thu, 24 Apr 2025 12:43:27 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6aa52sm1863494b3a.94.2025.04.24.12.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:43:26 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Ting-Ying Li <tingying.li@cypress.com>,
	Ting-Ying Li <tingying.li@infineon.com>,
	James Prestwood <prestwoj@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wireless-next 4/4] wifi: brcmfmac: Fix structure size for WPA3 external SAE
Date: Thu, 24 Apr 2025 21:42:39 +0200
Message-ID: <20250424194239.2825830-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.43.4
In-Reply-To: <20250424194239.2825830-1-arend.vanspriel@broadcom.com>
References: <20250424194239.2825830-1-arend.vanspriel@broadcom.com>
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
Tested-by: James Prestwood <prestwoj@gmail.com>
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
index 18129adb5dc2..1cbe66526d82 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
@@ -54,6 +54,7 @@ struct brcmf_auth_req_status_le {
 	u8 peer_mac[ETH_ALEN];
 	__le32 ssid_len;
 	u8 ssid[IEEE80211_MAX_SSID_LEN];
+	u8 pmkid[WLAN_PMKID_LEN];
 };
 
 /**
-- 
2.43.5

