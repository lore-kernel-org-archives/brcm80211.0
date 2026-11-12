Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460333;
	b=FvXFrWbq3cfixl6TW6ZzS1vpXR6vkay0DsvzbaSDCW7QlGAx5GHJkXPsp7R9bioSmaZS
	 5I4TAu7JRC9PrxqOmZIK/QGOK2mc8Pcfvk5WvU1pUcULC8lljcTlAFv5A/SaQVsLq1HA0
	 f0pzsHZkA1JHeUTzBN3lECWWC8zoVsNbHVEdO8LbUDyRWdunb0BF3RhK1FsxIh0smjX0U
	 vUdeiygUh9jjEeuD0Fz0ZQig3dj8nfI7WNo1pDlESsAqjt6fx/aPaixTFI6fBGjJafQG4
	 wda3NLSyJjm3I4AqME8Q/LekuWHfDrcZeMq3w8FYiPkcTGgLRhDKiYOZg0Poeie53Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
	b=VFgc7C5OoKA8Hh71oAHtuUAlA0ir0LONW0uKFJsWXVYQ1FiLvUqjkfL/He8gbdoz2/MD
	 uO8udWq8fPuD/eOHF4ifUg99yeCDJicb4qJyczNTl5RUZp6dic47677d9R+lRHsu086oK
	 BQjJs+xqcE0iprjvmw9zAVbzV/9ndM3lwgCT7eL75atDplUaIbKMKPACk/rHfj+PwSJGQ
	 z5XFwGpS3wSjvgxuyRtVLdKB+UGo1KjF+QPkcXK55O8RCYEfYwja6t38YBiT+NrxctwpA
	 e/Nih6X40+ryqdeGqplZJ94KAKUKEFawAWbmhmgyG5qxRhNHR2zbkCCI32hhMYXQxyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UMRfPI4C;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C07606A8BB
	for <brcm80211@lists.linux.dev>; Thu, 12 Nov 2026 05:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80C07606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UMRfPI4C
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-372bdb942dbso4985084eec.1
        for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 21:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460333; x=1795065133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
        b=UMRfPI4Cyb4gq/l5pfv9NLzJEmtC267tJwqZE6hqLSayWDk21uKRwmlFZmvtCxsDKn
         ZNM7Crf8VscR+r7b7yWTZ4Jk5svs9P8xDPXtkOqOi7T0CAzA4zt2uRKJboe0Jwvrz/nn
         HLkphXHPUL4WjdvBYG4iCXeqwP074V0YEiTcBDStht1c0KUxT+v6ou0VZI85keEr097M
         1SZPSbCJaP4pJqtGkJRSrzhB2FpmJSjmfzwVFEwNJHIL+fRQBRrcMSDud+Ujwh9m1CkQ
         ZNb5wpXSwcQRZzeq/kJAY7lvlHQKcYIOSYuWhg1Dxit4BTijpK+PIDfAawj8b2WEGyaH
         NjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460333; x=1795065133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
        b=A7cq03Xl1WctbfYrXlxe/K1CEWcNxhJT8sn04CWrb5qm6gsx0hSSdqZU9GUgRU3nNK
         eJ1xETM/BMfL4L0CZOzVnDTJYTTuVq0rpVE9w/cUY0FcZWp+3hpeWzppywdJEBcBgp3C
         qpXMc5cY8zqI9da753uvw4QKOZcSN75HGa3IUtWBzvUHEJTfBawj2tjXULGGtPj0ayal
         SXEKB5SLL6olYIWeQHGaCRAAoCsUbWLFmoaMnvrnMBQHbI8QL7eb3sbRkUisWLch3Qik
         lUDfnXCyRm0A5t6+iSRSIMuu6vgQpa6wnBwxn5EkUcoi+xjcP8UEzmfg8IkJQAiw95NN
         prLw==
X-Forwarded-Encrypted: i=1; AL+hErGOdmKOzfMxyBxCjBY+ZS91z+tezSoMHSkrg+0fx/r7arhwqovzUW7LmRJccjUt7PPhe+Zfff8Ty0Y=@lists.linux.dev
X-Gm-Message-State: APuU4Z/b6WbLRk71Zwzam/bhGurHBVGs2+E8c3tmh27SP5IBz7xHoi8r
	g3IicdSDBVPdDvLDVhEHvtW2ty9zNbLQtWCdjAMd+2l0qcOs0y3NheN2
X-Gm-Gg: AYBFou3L0aGO4jGZtxpzKbR+9t7jHBMmbp08TtE/vM+YZpnn8XZCpn3a8Vy0u9hq/KC
	RXiq7WI+nWieoyAte5X/uzqJ4WiWOiba+mVu/yaAvKiCDNtaJ6RHK8byYHekD9WzE2zA+jkGOHm
	zoi62UUnjj5SpxDgiCV8q59Wt4+t8bfThIMuXukrZ3cuGVUq1tbmbQu2zYrxCqfsGDqo0HN26pF
	+Jd/S9Ab0lW4NHq1zeTBGQz9vyiN+C5GC8otdiB0Vhh0kUIGugpdPADW3WHrL//Z+Otpq1Zpvhj
	W4+799mjcnj6qGE+YqqBqe9Irm95bFfP5Vz43ig3RWBAKuASVK6OL7xYzUw03lTRmdAkmA6eRfy
	fruUQQk33iTlJxYJR1iDWWRsmjxFo4FVYAyS/xHXTqRl2NHVlQvIngIDDZRBTIxERI/gxFax+k+
	6BYP6d4RFWWmKaFcc4M6SqOtIFsyaOEjXb+oMJ3Fc1M1YeF+/sakHiDY53VqpdocWuaEvJMs9zT
	XlWAY1z/INcqk8WSiPW0euj8hJS6z3+hY3Mk7DP4lhS8I5Ak9B1LKRviUtjhNn6kwoF2DHiINMl
	3ucS3kQYExYu8PsfPdxKg9Xc0ADlpCx4kXGCnUqpY2xBzBnEp8HvLAaJ
X-Received: by 2002:a05:693c:8814:20b0:36f:4615:9747 with SMTP id 5a478bee46e88-37680a5d9e4mr4675175eec.0.1794460332594;
        Wed, 11 Nov 2026 21:12:12 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:12:12 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] wifi: brcmsmac: round short-GI L-SIG lengths up to whole symbols
Date: Thu, 12 Nov 2026 13:11:32 +0800
Message-ID: <20261112051142.2797529-6-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112051142.2797529-1-ragulbaby@gmail.com>
References: <20261112051142.2797529-1-ragulbaby@gmail.com>
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

The L-SIG length of a mixed-mode frame covers its HT part in 4 us
legacy symbols.  For a short guard interval, the HT PHY's TXTIME counts
the data symbols at the guard-independent bits per symbol, then rounds
their 3.6 us each up to 4 us units.

brcms_c_calc_lsig_len() instead divides the bits by the short-GI rate,
which rounds the symbols down before scaling them and uses the rounded-
up rates of the MCS table, so it can count one symbol less than the
frame takes.  Count the symbols at the long-GI rate and scale them.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 46116d66f3..659b37bb43 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -7114,9 +7114,8 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 		 * the payload duration calculation matches that
 		 * of regular ofdm
 		 */
-		/* 1000Ndbps = kbps * 4 */
-		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec),
-				   rspec_issgi(ratespec)) * 4;
+		/* 1000Ndbps = kbps * 4, at the long-GI rate */
+		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec), false) * 4;
 
 		if (rspec_stc(ratespec) == 0)
 			nsyms =
@@ -7129,6 +7128,9 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 			    CEIL((APHY_SERVICE_NBITS + 8 * mac_len +
 				  APHY_TAIL_NBITS) * 1000, 2 * kNdps);
 
+		/* short-GI symbols (3.6 us) in 4 us units, rounded up */
+		if (rspec_issgi(ratespec))
+			nsyms = CEIL(nsyms * 9, 10);
 		/* (+3) account for HT-SIG(2) and HT-STF(1) */
 		nsyms += (tot_streams + 3);
 		/*
-- 
2.53.0

