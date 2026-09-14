Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C725E49B5B1
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 20:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416310; cv=none; b=uDpLKQw+ez1ZnaAUObKAdbSKcm3qF4Un1OpjtN/l5iJ70FohNpcHcv4ZWGYVgiw+to7fUzJZmgML9K+WMP0POvI3/16AyyA29EdFyPC9lytXXBzo/dqauEafaTOiHBp+72SmZFf7/OTOf5tkarRkPWBu/2MdPtUnsfqm8Yij9MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416310; c=relaxed/simple;
	bh=AzKSoRwvTjlokWKwNtPUDkmp7fh7XU/ixZUbBOqey1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sww9erkCxzaiqGjkRbYbZGlPJaL/1JIdBfgbAgULcKaVRPoI3YbtHjJpBUWOp+KYWLRca8CqxD+tx/0XE8P8y1ekqBU6frJ2m8hcg48enPGCpZ1qzT043Jtxm2Zr+0I4z91P9+w9Lcz2AJPvIifk8Ks4ogr1Sjm7LMbIxkgzP0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cBUXtZig; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cBUXtZig"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1797396a12.3
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416308; x=1790021108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIidc7nfo4IBJ7tzqZdeeXEx50mWtljjao4fEGgMHU8=;
        b=CFrXqL0OlipqNmknh4gXJ8DaK0LnvqCqRJgfRD4QzxX1nz67ULKTsEQ+rWSUrIZBwe
         7CaTNPxr1ABfvBVprGSZC0U/BOK9yQOaQ/iqytvPk/rNBTmlQWo+0+o2kRFepZjpGZI/
         v5d1WAWEAxGGLH52e2E4wf5lGXC++f6NPS8vipdB+7iiGRHdYyNUe3Mg2+wUranP9JL4
         /Nu2CDr8OF8FUMXh/RKAG+Ik0nE4t6732YWQiuhQTul+Q/aXfYMePQK7wZlw4eETbYQI
         oTSXE9jM2guf+Egw+18VP3G0AgyiMvT0g+yCgcCfYXPD25DKjyJNcpiruoywo9pCRIn5
         5+Fw==
X-Forwarded-Encrypted: i=1; AKwUvBybTw2U2OOZyeg0CJL6UKWDvULMvM5vGdqCbRUfB3dq5dd/Y2+saB+fEZFcZ7xlFHUqBS9QPAJDejU=@lists.linux.dev
X-Gm-Message-State: AFuF++l2qXzn9kVoxOieDnJ6gE+DnHeBRCbaYxJHu7cF0BWWlgdvKEVU
	L9+UmIb5MSsh2NgTvEg1Oxjw6t4L1jL5MLeiyxSYVVo9zQfUBt5b24YoyNWMDi2RkBNRyOfmh/h
	0bXc9EBHlEwjL9uN2/71ebanKpdNwftgklqP9vZW7U1UX+f+LAmksuGCeJSwetLcZeCr9xX6kET
	jmLq+LxyFlx/c+QvA5jtTpHLjANYpAg/qjuvY4SCqkP6gjG/m53E8h5Gf/6wPs8ZONIuYgZEI1U
	6DLeUxt2fknwlfj9wBJww==
X-Gm-Gg: AYBFou0r8Yb/fXt+eXYdK/zBX10stDG0STR8v9BOg4h4sxAcMtnGHQ3xSdQAY8ZE9xI
	6Fhxmv+8Qwjt9vXjvX3vCmcDeU2XVsmFH408b5mZ7HZK+Pc+yGeFt1mnic9drK52rfaBSExo3+i
	72/uy3YYMPRrP5wlh9T2CIXZsTnzfq+ARrqVNbWWNekzI58xcZmRyCu5+93D6n33Y9HiL4efcpu
	O3cvFETliDVgLp4knLZtbeU2Y7hM+cwXjVRvXlaiEqSuJfd92T5U3eaIycZb7PPpO/d0gE28A04
	pWuZyHHmGrwhIt/QRKrMwXr81lWcFiBqaU78YL/in8KgbrbqLyEDLca8UQF4j6zst6LlCHDB6+W
	VfeCt1JXCSQrrPcXKO5LfM/U+ZBZekGYzySlPiWVknECukMI1aSRgfDd9JD6xBtdhR29lR2JV96
	r1I8jN1UsmysQC4x9XK8wytl73lG6eBNYzWYG94qY=
X-Received: by 2002:a05:6a20:72a6:b0:3d1:60d3:99f8 with SMTP id adf61e73a8af0-3db4037d7e3mr8136267637.5.1789416307932;
        Mon, 14 Sep 2026 13:05:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-33ba4eba4bbsm184308eec.15.2026.09.14.13.05.07
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:05:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e80ce3597so86582046d6.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416306; x=1790021106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIidc7nfo4IBJ7tzqZdeeXEx50mWtljjao4fEGgMHU8=;
        b=cBUXtZigzfBXN3O+J5zhFVAVzwoC9pYuZn9BlZHnO+oQIcdOkmkx23pVisZtLZbZW9
         kHoCg1yVAH52U9CgMrQgs8acmaIBpcdmVbTQAiIuzrJ5JbGKNvMpgAqwoisbe03urbtb
         wtoQ+Zvs79npSLNR4moeVDVU3XAToOVPOmyfY=
X-Forwarded-Encrypted: i=1; AKwUvByymF1lzlnJ74Od8dz0kxlOzn7D75d32wqZzwjAxawJRz3x78PvwKZN37gIuKAls+7p61XcWS926+Y=@lists.linux.dev
X-Received: by 2002:a05:6214:5003:b0:90c:e613:4e33 with SMTP id 6a1803df08f44-9122e52e2a2mr65468076d6.23.1789416306073;
        Mon, 14 Sep 2026 13:05:06 -0700 (PDT)
X-Received: by 2002:a05:6214:5003:b0:90c:e613:4e33 with SMTP id 6a1803df08f44-9122e52e2a2mr65467406d6.23.1789416305608;
        Mon, 14 Sep 2026 13:05:05 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a6ebsm103081106d6.22.2026.09.14.13.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:05:05 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Ryohei Hashimoto <laurel.medalist12@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v3] wifi: brcmfmac: log the firmware status when a connect fails
Date: Mon, 14 Sep 2026 22:05:02 +0200
Message-ID: <20260914200502.1747715-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260913165526.4426-1-laurel.medalist12@gmail.com>
References: <20260913165526.4426-1-laurel.medalist12@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Mon, 14 Sep 2026 01:55:26 +0900, Ryohei Hashimoto wrote:
> brcmf_bss_connect_done() receives the firmware event in @e but discards it
> on the failure path.  Every failed connect is reported to cfg80211 as
> WLAN_STATUS_AUTH_TIMEOUT (16), whatever the firmware actually said, so
> userspace only ever sees:
> 
>   wlan0: CTRL-EVENT-ASSOC-REJECT bssid=00:00:00:00:00:00 status_code=16

[...]
 
> The status reported to cfg80211 is left alone; changing it would alter what
> userspace sees.
> 
> [1] https://github.com/RPi-Distro/firmware-nonfree/issues/38
> [2] https://github.com/raspberrypi/firmware/issues/1829
> 
> Assisted-by: Claude:claude-opus-5

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Ryohei Hashimoto <laurel.medalist12@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 ++
>  1 file changed, 2 insertions(+)
