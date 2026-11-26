Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655453;
	b=LEgbg2lHlFUJnoUnizhfetwhvL+WfqJEZdbe5DaaYTh8thvzw2wh8wf5sh/EiKjqY9h4
	 5oqTqJsyv32sFBlEvmvm9PGJ0zGsSwFVQqVXe8U57lyJr3lWtrOyMuT+YcNQn7x9W7e69
	 sU24jfmUlOBNiQcr6OPJiRY9FZkqOwo323m1D2qEYdhXbAabdYJzp4mDi7yLmHIuU5b7T
	 UpFqFKFwBOoZ8CaNubj6zMJVIl/2KyCjPfIDcBMqfI7ixTDBNzXqCKfcy/YvZOX2op3K9
	 VjH5Ik4aQvf4F1zbiev6RiSabWeta723rJnoQ338wuzkLU9r5M83rQM0Sf2NGnxLZpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=CI5zhKvhVeYhJ8KzMa1qCsOVacszMfgXuCmQJ6oAUbM=;
	b=nUtz+pe/HhuzSNGT7hW2iO+jUlWfM7ooWSTLcRCKfypRonuwAQHH7Foy3dUDnFPmAtj4
	 jVbtLbNnnR/8kUsNDIvEALlElJCx+75gYOFOHrUmAFZAucZGNBS0Hg5Rf33Xj7cVevN6Z
	 hUbYNxGAHiRdChxroU6axWLtxguMPn7/IWF1xsU6dDXECk8uRrUb290kQskpPz/29GDRQ
	 qb2fQiFOAqbApBvY1xXaunqf3XBgIiR/2/jNWJGZ+5mVtNmo9eDr3FwhxHf0K4L04MZh4
	 PG9w3PyWSgmg7fBox1YbAJvl+3Mr1P5ZDvcq9VQ9ecQVaDw0ZwKV+d0tYzn9sko/WNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f2raZKxq;
	arc=none smtp.remote-ip=74.125.225.136
Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE76C606A335
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 01:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE76C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f2raZKxq
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4bb86801c8fso1184945e9.0
        for <brcm80211@lists.linux.dev>; Wed, 25 Nov 2026 17:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655451; x=1796260251; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CI5zhKvhVeYhJ8KzMa1qCsOVacszMfgXuCmQJ6oAUbM=;
        b=f2raZKxqed1qyFKxRUMPKcYVDH5G9xsJJieRiMwRm/v1Fu8c/EursKXhvyvdW5sUff
         T7dwEUUoaqm3goF/dOsNkjgX1mHlD4wBUq8BKfHq18uMzM6tt89ApU9EmSrD4hSdZTxr
         vEJi1S0E6g1J0n5QHfw1GAKkqA4tDBPvA9EA52+ZMl7ho7hKoiuGpwML49y6P4OsIU/e
         nv0TrQq86T2hxMFKt96JF8mM04rd4VPeMcN8NzTFHogS/POdWsoHfOGfAUtYmo6h5J6c
         QoHd1zPPMd7WM9oYde6rTYfNwJ3orhEqxBM2RZBkvaSZqL4XyeWnsSx5AH1QM8/pRDrK
         myTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655451; x=1796260251;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CI5zhKvhVeYhJ8KzMa1qCsOVacszMfgXuCmQJ6oAUbM=;
        b=dLYDMXYeUmProRsifZ9q/Apx5sT0lGwW0Uw/dIt0mL0dGl+KLs3kq+nh2sUnG+0DnS
         GtDWNxpTT/3jNjjywe/9lyiXUzN67gt3RdWjDsYlzjjfmmTDvOwbIdGsaOhgsNGe9FAE
         n8Cp1KhxTG+i9jZZyubO2lXtfRRToLbiUvcYK2ApQBI4fsgJVgb7061cvxUKVnp6x0jK
         hntMOj6x4Xnr9zbWxkyHfcq9BM+g5p5dmr84KD4G5jtTznu3XnijohlnNmHIUEhCWY3c
         FwUY2MtNwN5XH53BbOiAk3Ee00O2ZpfmyXLStO5tGlG/4dS/h8CIZFV7fu6Lp2e4CONz
         6hTA==
X-Forwarded-Encrypted: i=1; AL+hErHzG2koo8l/NJd59hzN+nmvvDhXA8T17pZMuW3EaUl7zlCTBIvWK02Phao5+gWZxMT8ngTZGVl+2qw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/fc7HWMfDeydYy4cgSuTjM3sIKK0s8qPO46PkcR6C8gdskxwmd
	u/+hj1cI7S6f0N8wHiVL6nnABYeOEQJOt5yOhPTPx3EYO0OvOVJ+aidT
X-Gm-Gg: AZFdTZfiBhLRdTdeh1Ul/aXU7XyZBL/8SBM1c5hzqXawxQHiI24xnWpgFcyQQBSUYNW
	rFUdmxuKnwcab7EpOaewqzgfUwovuxovw/XJ4we0GXYuoIKTlkgUitXSj53MsEH5+xxfd6yOaHq
	t5ZEJEW/S8vgJ+lbuQpoMkjt2WV7xxEkkiljfLo8yepUJZeDzNqRaskxDOydYBAwB34sCezKXK/
	/t9zfntNyT6dsWt9jnnhHiFXFEFCbKRIHVBwoq3o5CIDyIz7U9KCk7mNZ7RltiUb0YiqvKHJJXT
	Xvf4xS1ZxYp2PUKj7OjzcTxmgbpaUwhTX1legfgWWJlOowqFUwYlqua02kIV2nIWBRJ/Z1EkUwq
	ifK4mSeBFVBOBHnlWvf9WoO4Ph/zt/rtAbPf7cJyueSPHgOfHCBYpTn5t42YnwDufS/FRIPsURu
	OA46GfqsnAxrDPYHOzkoz0Hzs2PsBiYUra/GoyrxaWQmi10E3MTQ1l9bQ6pakOwaA7o0zTElWPx
	SIkTkRmf670sOQN6Rs+mGrPMFi4DDd4/hc4jCFTwvePi7A80bA+VDDzWpG/BZ9IGGZNjrb6x9Bj
	uAVlbe/3mGxE3ZPzYDFXIhqu1dwc9CtfiaLnE+qsJlKBxo3zDJcRvj5m/A==
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr370247515e9.9.1795655450984;
        Wed, 25 Nov 2026 17:10:50 -0800 (PST)
Received: from [192.168.1.11] ([31.94.68.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm877678425e9.14.2026.11.25.17.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:10:50 -0800 (PST)
Message-ID: <5bbfff95-a4c8-4fe6-a56f-01ac8bf4a473@gmail.com>
Date: Thu, 26 Nov 2026 01:10:48 +0000
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, Hamid Zamani <hzamani.cs91@gmail.com>,
 Kalle Valo <kvalo@kernel.org>, Hector Martin <marcan@marcan.st>,
 Michael Reeves <michael.reeves077@gmail.com>,
 Jason Huang <jason.huang2@infineon.com>,
 Carella Chen <carella.chen@infineon.com>,
 Darren Li <hsin-hung.li@cypress.com>,
 Girish Rudrappa <girishbukkasagara.rudrappa@infineon.com>,
 Daniel Berlin <dberlin@dberlin.org>,
 Johannes Berg <johannes@sipsolutions.net>
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH wireless-next] wifi: brcmfmac: probe VHT80-capable regrev on,
 BCM43602 ISO3166 fallback
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On platforms without a platform/DT country_codes mapping (such as x86
Apple iMac and MacBook Pro systems), brcmf_translate_country_code() falls
back to passing the ISO 3166 alpha2 country code with rev = 0 to the
BCM43602 firmware.

In the BCM43602 firmware shipped by linux-firmware (7.35.177.61, r598657,
PCI 14e4:43ba), rev = 0 enables 80 MHz VHT channels for US, but disables
all 80 MHz channels for European/ETSI country codes such as DE, GB, and
EU. As a result, 802.11ac links in affected regions are capped at 40 MHz
even when both the firmware and AP support 80 MHz.

Probing the firmware's embedded CLM table via the "country" iovar on
7.35.177.61 shows why neither rev = -1, a fixed non-zero rev, nor
selecting the highest accepted rev is safe:

  req     fw      2.4G ch  5G ch  80MHz ch  DFS ch  Notes
  ------  ------  -------  -----  --------  ------  ----------------------
  DE/0    DE/0    13       19     0         15      40 MHz only (current)
  DE/2    DE/2    13       19     16        15      first VHT80 rev
  DE/3    DE/3    13       19     0         15      regresses to 40 MHz
  DE/7    DE/7    13       19     16        15      VHT80
  GB/-1   GB/0    13       19     0         15      40 MHz only
  GB/0    GB/0    13       19     0         15      40 MHz only (current)
  GB/1    GB/1    13       19     0         15      40 MHz only
  GB/2    GB/2    13       19     16        15      first VHT80 rev
  GB/3    GB/3    13       23     20        15      adds 4 UNII-3 ch
  GB/6    GB/6    13       19     16        15      VHT80
  EU/0    EU/0    13       4      0         0       40 MHz only
  EU/13   EU/13   13       16     12        12      first VHT80 rev
  US/0    US/0    11       25     24        16      already VHT80
  US/1,2  US/1,2  14/11    0      0         0       5 GHz disabled
  US/9    US/9    13       25     24        16      opens 2.4G ch 12-13

Keep rev = 0 as the initial request so countries such as US/0 succeed
without extra firmware commands. On BRCM_CC_43602_CHIP_ID without a
platform country_codes table, if rev = 0 leaves a VHT-capable 5 GHz band
with no 80 MHz channels, probe ascending revisions (1..15) for the same
alpha2 and compare per-band channel bitmasks via brcmf_chan_mask() to
select the first revision that:

  1. enables at least one 80 MHz 5 GHz channel,
  2. enables no 2.4 GHz channel disabled under rev = 0, and
  3. disables no 5 GHz channel enabled under rev = 0.

If no revision satisfies these constraints (e.g. E0), restore rev = 0.
cfg80211 continues enforcing Linux wireless-regdb rules on top of the
firmware channel list.

Tested on Apple iMac17,1 (BCM43602/1, 14e4:43ba, firmware 7.35.177.61)
against a 2x2 80 MHz 5 GHz AP on channel 48 (5240 MHz, GB/DE regdom):

  Metric                 Before (rev=0)        After (probed rev=2)
  ---------------------  --------------------  -----------------------
  Channel width          40 MHz (5230 MHz)     80 MHz (5210 MHz)
  5240 MHz iw flags      20MHz HT40-           20MHz HT40- VHT80
  RX / TX PHY bitrate    400.0 / 400.0 MBit/s  866 / 866 MBit/s
  iperf3 TCP TX / RX     325.0 / 315.8 Mbps    635 / 599 Mbps

Fixes: 21947f3a74d6 ("brcmfmac: use ISO3166 country code and 0 rev as fallback on brcmfmac43602 chips")
Signed-off-by: Richard Lane <richardlanedev@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 57689026525e..a90a7c1cdad1 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -8442,6 +8442,62 @@ brcmf_cfg80211_dump_survey(struct wiphy *wiphy, struct net_device *ndev,
 	return err;
 }
 
+static u64 brcmf_chan_mask(struct ieee80211_supported_band *band, u32 reject)
+{
+	u64 mask = 0;
+	int i;
+
+	if (!band)
+		return 0;
+
+	for (i = 0; i < band->n_channels && i < 64; i++) {
+		if (!(band->channels[i].flags & reject))
+			mask |= BIT_ULL(i);
+	}
+	return mask;
+}
+
+static void brcmf_probe_vht80_regrev(struct wiphy *wiphy,
+				     struct brcmf_if *ifp,
+				     struct brcmf_cfg80211_info *cfg,
+				     const struct brcmf_fil_country_le *base_cc)
+{
+	struct ieee80211_supported_band *b2 = wiphy->bands[NL80211_BAND_2GHZ];
+	struct ieee80211_supported_band *b5 = wiphy->bands[NL80211_BAND_5GHZ];
+	const u32 no80 = IEEE80211_CHAN_DISABLED | IEEE80211_CHAN_NO_80MHZ;
+	struct brcmf_fil_country_le probe;
+	u64 base_2g, base_5g;
+	bool dirty = false;
+	int rev;
+
+	if (!b5 || !b5->vht_cap.vht_supported || brcmf_chan_mask(b5, no80))
+		return;
+
+	base_2g = brcmf_chan_mask(b2, IEEE80211_CHAN_DISABLED);
+	base_5g = brcmf_chan_mask(b5, IEEE80211_CHAN_DISABLED);
+
+	for (rev = 1; rev <= 15; rev++) {
+		probe = *base_cc;
+		probe.rev = cpu_to_le32(rev);
+		if (brcmf_fil_iovar_data_set(ifp, "country", &probe,
+					     sizeof(probe)))
+			continue;
+
+		dirty = true;
+		brcmf_setup_wiphybands(cfg);
+		if (brcmf_chan_mask(b5, no80) &&
+		    !(brcmf_chan_mask(b2, IEEE80211_CHAN_DISABLED) & ~base_2g) &&
+		    !(base_5g & ~brcmf_chan_mask(b5, IEEE80211_CHAN_DISABLED)))
+			return;
+	}
+
+	if (dirty) {
+		probe = *base_cc;
+		brcmf_fil_iovar_data_set(ifp, "country", &probe, sizeof(probe));
+		brcmf_setup_wiphybands(cfg);
+	}
+}
+
 static void brcmf_cfg80211_reg_notifier(struct wiphy *wiphy,
 					struct regulatory_request *req)
 {
@@ -8483,6 +8539,9 @@ static void brcmf_cfg80211_reg_notifier(struct wiphy *wiphy,
 		return;
 	}
 	brcmf_setup_wiphybands(cfg);
+	if (ifp->drvr->bus_if->chip == BRCM_CC_43602_CHIP_ID &&
+	    !ifp->drvr->settings->country_codes && !ccreq.rev)
+		brcmf_probe_vht80_regrev(wiphy, ifp, cfg, &ccreq);
 }
 
 static void brcmf_free_wiphy(struct wiphy *wiphy)

base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.55.0
