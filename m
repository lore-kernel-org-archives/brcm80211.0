Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807D63B0AE3
	for <brcm80211@lists.linux.dev>; Tue,  1 Sep 2026 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288584; cv=pass; b=MvLeLD1Ehg2l7AS5nOJ8j7DM2LGbtg7WM0STL5IuUlBDHI8wIMQjuQoJKdG7yS6Cy/fe5hf0ZBwkOMf4B8WpSp6guWz9NLbhK98a0nyGDWPVWdanX6CymlcefBPxUBjXs9Uo4dVqn8asbLA/enWxYBAvBb14a710rPjDM/aumrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288584; c=relaxed/simple;
	bh=ODDKSEGUX36HrHhP+QmmYV5FWH0+4pri4u9TtrMt2gU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TS5nRkA7NNSdvimvFc/6u86zEWBPYNnfBHaHE/3NrT+ocQ5dokSvi2tp0F/wnRTooy88IsUZTK1MffJ0Sumz2kXsdoZXp3LZ7fnnpUfBRA3IMtgrUPRFBrpH0PBjSvh8xj4GFKsEkHXdX96lhckMtKOVFWxcSoZot1fxOlwply0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8JM+T92; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8JM+T92"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c252c7270faso13772266b.3
        for <brcm80211@lists.linux.dev>; Tue, 01 Sep 2026 11:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788288578; cv=none;
        d=google.com; s=arc-20260327;
        b=SdW+xuFLA2juVw0ZauLu1S0I9Q7mrnBl2zWCfWNJhFVrADGtWBuB6qnDm7kjEXXSc1
         bpd9K8IqaSDXh8+NZ/m4A5EAU6KZV9qMH5czbFK7RUxO62n/6o+uiyAnUyYm9S5o/L41
         jUwWibkyQndVHAn0x85jWNOedTkas/V42uphHxk9u7D5Br4Yt/j6WQzvY9yyWHK2skhw
         mA6IKsQwWMCaxEwsnpprVzda1RVTEiajBnMjrmmz7e+Jgiaf7Pvvuuqw6ENg/SjkZFHQ
         3awQgKRL4rWaXOoowsXqsKy5LUXCUOvHfBrMsHC/WOmZKYlXk68RFxLKp7eDE36rNCkZ
         Mp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=ic7IY1tCHu3gWFgXVPzx+1RT4y5KILIZ0cDGhx4O3jA=;
        fh=sROpPqsMwfVYSHSigNDeNM38Hdg/nIVmREtn4XdtY2g=;
        b=rrbsd0cPt8cZOWleiMRz+iKzh7EmyA0je7hg7y+u61hebx7YSQKmlSFRkasH42Zj3e
         Xq+1yzcpN28onvkoEGhDhgL0FspSXl/5NWgTUXAhJIhF7zBastFSHkhIL4qGQI5lw2SR
         wTnN2tRY5g3oTIZY0wYIzLjn11EJocMqnfP4dFcREu7n5AJZ+6Y6AnI43wLO7KeLryO7
         OlpGW7o0/nO3dytPDt1XhJJxdSvGKNURGOGYNlZd0Yz/4quxy0xf/fK4exS8+9/dyxdN
         lj7ZHUx0LrQPD64SOkNOVGDvggfCJXZqneTS6v6EKFoJGnNWijPpcYbfxmGU8ipPcbXe
         rO1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788288578; x=1788893378; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ic7IY1tCHu3gWFgXVPzx+1RT4y5KILIZ0cDGhx4O3jA=;
        b=A8JM+T92k0bYV8XGdx2A5ponkhaewWfVEn97WWruQpZgnChKgZmu5VHkRuSnEHKWYX
         Hxt1ju1GrEGf0KcvMKnMQ54aSgToxsTklfjAaq/q6HoJJxzBDyV8YkPx3oKdGLtgPFMW
         yFdzzAXJrdBRCSYmfJhFU0104raLX0xAQwFZXpQmBVblO7XIL3tzlS537mnIFpNysec5
         Jesh/htg/R1hwtpSQEFitl9BbM7ZTE7ntraqfjwtSqM99QGGYYobRw0bIHL4MAv82ETh
         n1g3MnT7t5UOlwVaOtzoqIRv/JhL5gnmfzuektk49xr/ALXV3PhUCVajO+AH7OnnDwbI
         Br8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788288578; x=1788893378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ic7IY1tCHu3gWFgXVPzx+1RT4y5KILIZ0cDGhx4O3jA=;
        b=j6xevlpPa8zLZzoHGKDaOYAcO+3uv+Hq2IJyEn0YRassruwWAyNutJO+9ts/ZrUIL8
         GO71CjS1nnAXHo0CBYZFn5K55gzEICTbpyLm7g/1toRj3yt7bX/uVFWjoLfubo5xSvx0
         tS03eA3IZZiYupCq5vE5LHbHSKU0GDTUzrpgIz++42d0oH9rPyQFT41ptDIEejZczpc7
         LySrMTE604nYMY7XAAyrqvRbgjbbrpbBYyKEHoKML208K4woAQX73nrObrvE2tJdJ9q2
         9GhP0qvkD0n+S/IBl7El8H7ckcupOuHmeggFjSPDEngfRUC0CZWP2xW+ABLmwDX1xZDb
         vBsA==
X-Forwarded-Encrypted: i=1; AHgh+RrZr7p0nQd7ZIT15hVHVGQdHKFxOLlAvZPakV/FmlJF8FBT15p685xytlWNWYEFB2/IGrZ6VjQMNrk=@lists.linux.dev
X-Gm-Message-State: AFuF++mVtuMrUasPDF8jLac4Rn6Vd64VF5VOwsVGlgvupHpPkEv9B2LL
	4ZeXa5iEGK8ZKrsturV5JP3Cz2ocFIOIECdiq7fSOVxOBj4ya1q7M4jlz1nRGHRQ3FwUwlA6/VA
	ynyD5RIjUgsoU7u43PvEhohb+5F+e8Bc=
X-Gm-Gg: AR+sD12OZUH1ZKEnZgB4xBlNRGS1Ya9zDzjjVsz+BGvLBZfNokrpG2iXj1iY+od+x6L
	DYA492YANou3XpMAZVBDFgVGS27sDnNzf9wasIcxp8/cnMEtyWaxbwRdvBFmTQ/YBfhxuKDs+Tz
	3nqxIlV5i8esoMObF+7ENcYMMGw505v9iX+lyQNOgIXun0VX/tOuts8/uh9YuoxFACywZZWXZ/E
	+KDHmK0x7iJryZvcMGUDsnHPDT1q1o0nc/dh9EHBPw+ClLr3iZmXg/8v7t8N5AIrkO1KfTMfRCh
	uhlC7ptZbUXdsBbKWYVg2efKju1AufO2HdXthOuG+Xc=
X-Received: by 2002:a17:907:72d0:b0:c24:87e5:6491 with SMTP id
 a640c23a62f3a-c25b3b80b3amr742600966b.2.1788288578159; Tue, 01 Sep 2026
 11:49:38 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 11:49:37 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 11:49:37 -0700
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?Vin=C3=ADcius_Ramon_Fontanela?= <vfontanela@gmail.com>
Date: Tue, 1 Sep 2026 11:49:37 -0700
X-Gm-Features: AcwNN1UBorG74abm2Klh7rD57gWa3Wyc_yeCawRSJkVUCfc1aYehbujbOrBQ6po
Message-ID: <CAKuTqBQoU9sSN7AzOQ5kBbBjt0CD=N0KBK8GwocBn1dOEVdVNA@mail.gmail.com>
Subject: [PATCH] wifi: brcmfmac: allow ISO3166 fallback for BCM4350
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Vin=C3=ADcius Ramon Fontanela <vfontanela@gmail.com>

BCM4350 devices using brcmfmac on x86/PCIe may have no platform-provided
country code map. In that case brcmf_translate_country_code() falls back
to ISO3166 codes only for chips accepted by
brmcf_use_iso3166_ccode_fallback(). BCM4350 is currently missing from
that list, despite the adjacent BCM4345 and BCM4356 being present.

Without a country_codes table, BCM4350 therefore returns -EINVAL from
brcmf_translate_country_code(). brcmf_cfg80211_reg_notifier() silently
returns at that point, so the firmware never receives the requested
country iovar. On a MacBookPro14,1 with BCM4350 PCI device 14e4:43a3,
this left the firmware unable to scan UNII-2e DFS channels 100-144 even
though cfg80211 exposed those channels as available.

Adding BCM4350 to the ISO3166 fallback fixes the issue. Tested on a 2017
13-inch MacBook Pro (MacBookPro14,1), Fedora 44, kernel 7.1.12, with an
AP on channel 116 (5580 MHz). Before the change the AP was absent from
scans; after the change it is detected and NetworkManager connects to it
normally.

Signed-off-by: Vin=C3=ADcius Ramon Fontanela <vfontanela@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 000000000000..000000000000 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -7948,6 +7948,7 @@ static bool
brmcf_use_iso3166_ccode_fallback(struct brcmf_pub *drvr)
 	switch (drvr->bus_if->chip) {
 	case BRCM_CC_43430_CHIP_ID:
 	case BRCM_CC_4345_CHIP_ID:
+	case BRCM_CC_4350_CHIP_ID:
 	case BRCM_CC_4356_CHIP_ID:
 	case BRCM_CC_43602_CHIP_ID:
 		return true;
--=20
2.51.0
