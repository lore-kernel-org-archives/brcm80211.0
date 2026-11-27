Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783285;
	b=AkxPiGn13PT7o/IEv9FyQJ55PuRHqhZ18ImjuVljDvv9P8OZT0SWf6R1fXHxcEwZxgez
	 9sXgG5VgjyS2TSdtoEHWLh2ZxLDE2/WcJXHtwivSr71x4n8hBdQsMt5EyKbS1AtIRzTgn
	 v/XwtHHeQ6KJLWWmlnaonNiulACIRH80K6Nuo6q2K3YV+SE2uzEFDKErkSmSIab+o70pf
	 lGevZHXaTwJkssbnM6/e3MJlKz5tCVoj4ywps4p/6eIBGzNbriwEbJyi2I0PvbgQzZFy0
	 BJIsRSXxgWAnkkJHFQFoBKQAi3FiYxMkbCXcmhqGfrj5qNpes3/O5KTrLgNDZuJBZgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783285;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zHI3cn66RSiDsJR7apWcYmASU6A60Knnp0cPtOX6jkM=;
	b=HZgofxDaUOJzRz1ILzhMcIMyKLwMUhUZ8YbEgmzlbA1Vpzocan4xLyVOCuCE9M2CsnNf
	 Qe4bnRr1fPPu3tj/9nDc9MtlTxuNpm+PqPKdptPwo4VwpkxXV6c8W7pqQ07fe3kvwHrR+
	 EOACiZk3iS4Kf5St20BF8bcNXmyaslaE1OmQss4+3M59/xRJwx+vNNtTHF1zKnkHD2OG0
	 ELB5qnqlPRoubtVU8mmPaEn199rPHLuEPgos9g+cko7idXgxAMtOUGzI3ZhQWQBDn/W+D
	 1ToALVARxZltBwsUwgSjH6OZeS4epg7Op5H/eMPW5Lj8XqkZySUBZT7DkHcu0rR6wMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=FJpMVw6d;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D45606A6A3
	for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 12:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21D45606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=FJpMVw6d
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795783283;
	bh=jSoH/CB/7IptnipxgUuyAja1GpcqTwsCQdNyhyFt7K4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FJpMVw6dL/gszeidFd7fuHY084vr5kJyq0QCmvEigG9RAxZ/zJhU9cxGIWUH8aysD
	 sbedIWRIgWTkXkqgQOLwF4Sveidlg37RRw9/Fy7wb+WRZ1g1ZcpcDkjx8cNCNvx6Xf
	 Ui0bgI7wb2ZZVk6sf2JuQqSr3DwDpIUD9guZyWavzZVHrqfWa3wO0Di991iY9BPoTS
	 mpth3um29/zxuRwlwtTG8KudxFHm7XLVagGH/kno/uIdMQnrTkop1+QJPLCSIvkdES
	 lLuJUJ5XrD6jyySyQfgBKcc4Otbux1X9fGohzS8aNzGdAeUL6IJpiJrXrRvUoD10XL
	 n0dPlpWcVMtWg==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: [PATCH wireless-next v3 6/6] wifi: brcmfmac: pass AWDL frames and role changes to user space
Date: Fri, 27 Nov 2026 13:41:04 +0100
Message-ID: <20261127124104.233236-7-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127124104.233236-1-dev@deq.rocks>
References: <20261127124104.233236-1-dev@deq.rocks>
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

User space runs the AWDL election and peer discovery from the AWDL
action frames of other devices. The firmware reports them on the AWDL
interface with ACTION_FRAME_RX and AWDL_EVENT, behind a header of
version 1 (16 bytes) or 2 (24 bytes), and its AWDL role with AWDL_ROLE.

AWDL_AW, AWDL_ROLE, AWDL_EVENT, AWDL_STATS and SDB_STATE are event codes
of the Apple firmware. Add them as abstract event codes, mapped and
registered by the WCC vendor module like the CYW module does for its
events.

Pass the AWDL action frames and role changes to user space as the
vendor events AWDL_FRAME and AWDL_ROLE.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../broadcom/brcm80211/brcmfmac/awdl.c        | 110 +++++++++++++++++-
 .../broadcom/brcm80211/brcmfmac/awdl.h        |   3 +
 .../broadcom/brcm80211/brcmfmac/fweh.c        |   8 +-
 .../broadcom/brcm80211/brcmfmac/fweh.h        |   7 +-
 .../broadcom/brcm80211/brcmfmac/vendor.c      |   8 ++
 .../broadcom/brcm80211/brcmfmac/vendor.h      |  12 ++
 .../broadcom/brcm80211/brcmfmac/wcc/core.c    |  39 +++++++
 7 files changed, 177 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
index b9f2ca319084..f157a247bd31 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
@@ -731,17 +731,113 @@ static void brcmf_awdl_settle_work(struct wiphy *wiphy,
 		       sizeof(dwell_off));
 }
 
+/*
+ * ACTION_FRAME_RX and AWDL_EVENT put a header in front of a received frame.
+ * Its first 16 bits, high byte first, are the version: 1 is struct
+ * brcmf_rx_mgmt_data with 16 bytes, 2 has 24 bytes.
+ */
+#define BRCMF_AWDL_RX_HDR_V1_LEN	16
+#define BRCMF_AWDL_RX_HDR_V2_LEN	24
+
+/* AWDL action frame: vendor specific category, Apple OUI, type AWDL */
+static const u8 brcmf_awdl_af[] = { 0x7f, 0x00, 0x17, 0xf2, 0x08 };
+
+static struct sk_buff *brcmf_awdl_event_alloc(struct brcmf_pub *drvr,
+					      int event, int len)
+{
+	struct brcmf_if *pri = brcmf_get_ifp(drvr, 0);
+
+	return cfg80211_vendor_event_alloc(drvr->wiphy,
+					   pri && pri->vif ? &pri->vif->wdev :
+							     NULL,
+					   len, event, GFP_KERNEL);
+}
+
+/**
+ * brcmf_awdl_fweh_event() - pass a firmware event of the AWDL interface on.
+ *
+ * @ifp: interface of the event.
+ * @e: event message.
+ * @data: event data.
+ *
+ * Called from the firmware event worker for the events of the AWDL
+ * interface, which do not go to the cfg80211 handlers. Received AWDL action
+ * frames and role changes become vendor events, other events are dropped.
+ * AWDL_EVENT carries an AWDL action frame with some of its status values.
+ * Return: 0 or a negative error code.
+ */
+int brcmf_awdl_fweh_event(struct brcmf_if *ifp,
+			  const struct brcmf_event_msg *e, void *data)
+{
+	struct brcmf_pub *drvr = ifp->drvr;
+	struct sk_buff *skb;
+	u32 hdr;
+
+	if (!ifp->awdl)
+		return 0;
+
+	switch (e->event_code) {
+	case BRCMF_E_ACTION_FRAME_RX:
+	case BRCMF_E_AWDL_EVENT:
+		break;
+	case BRCMF_E_AWDL_ROLE:
+		skb = brcmf_awdl_event_alloc(drvr, BRCMF_VNDR_EVTS_AWDL_ROLE,
+					     NLMSG_DEFAULT_SIZE);
+		if (!skb) {
+			bphy_err(drvr, "AWDL role event dropped\n");
+			return -ENOMEM;
+		}
+		if (nla_put_u32(skb, BRCMF_AWDL_ATTR_ROLE, e->status)) {
+			bphy_err(drvr, "AWDL role event too large\n");
+			kfree_skb(skb);
+			return -EMSGSIZE;
+		}
+		cfg80211_vendor_event(skb, GFP_KERNEL);
+		return 0;
+	default:
+		return 0;
+	}
+
+	if (e->datalen < 2)
+		return 0;
+	switch (get_unaligned_be16(data)) {
+	case 1:
+		hdr = BRCMF_AWDL_RX_HDR_V1_LEN;
+		break;
+	case 2:
+		hdr = BRCMF_AWDL_RX_HDR_V2_LEN;
+		break;
+	default:
+		return 0;
+	}
+	if (e->datalen < hdr + sizeof(brcmf_awdl_af) ||
+	    memcmp((u8 *)data + hdr, brcmf_awdl_af, sizeof(brcmf_awdl_af)))
+		return 0;
+
+	skb = brcmf_awdl_event_alloc(drvr, BRCMF_VNDR_EVTS_AWDL_FRAME,
+				     e->datalen);
+	if (!skb) {
+		bphy_err(drvr, "AWDL frame from %pM dropped\n", e->addr);
+		return -ENOMEM;
+	}
+	if (nla_put(skb, BRCMF_AWDL_ATTR_ADDR, ETH_ALEN, e->addr) ||
+	    nla_put(skb, BRCMF_AWDL_ATTR_FRAME, e->datalen - hdr,
+		    (u8 *)data + hdr)) {
+		bphy_err(drvr, "AWDL frame from %pM too large\n", e->addr);
+		kfree_skb(skb);
+		return -EMSGSIZE;
+	}
+	cfg80211_vendor_event(skb, GFP_KERNEL);
+	return 0;
+}
+BRCMF_EXPORT_SYMBOL_GPL(brcmf_awdl_fweh_event);
+
 static void brcmf_awdl_send_result(struct brcmf_pub *drvr, int event,
 				   int status, struct net_device *ndev)
 {
-	struct brcmf_if *pri = brcmf_get_ifp(drvr, 0);
 	struct sk_buff *skb;
 
-	skb = cfg80211_vendor_event_alloc(drvr->wiphy,
-					  pri && pri->vif ? &pri->vif->wdev :
-							    NULL,
-					  NLMSG_DEFAULT_SIZE, event,
-					  GFP_KERNEL);
+	skb = brcmf_awdl_event_alloc(drvr, event, NLMSG_DEFAULT_SIZE);
 	if (!skb)
 		return;
 	if (nla_put_s32(skb, BRCMF_AWDL_ATTR_STATUS, status) ||
@@ -859,6 +955,8 @@ const struct nla_policy brcmf_awdl_vndr_policy[BRCMF_AWDL_ATTR_MAX + 1] = {
 	[BRCMF_AWDL_ATTR_IFINDEX] = { .type = NLA_REJECT },
 	[BRCMF_AWDL_ATTR_PEER_IES] = { .type = NLA_BINARY,
 				       .len = BRCMF_AWDL_PEER_IES_MAX },
+	[BRCMF_AWDL_ATTR_FRAME] = { .type = NLA_REJECT },
+	[BRCMF_AWDL_ATTR_ROLE] = { .type = NLA_REJECT },
 };
 
 /* The device of a vendor command and its parsed attributes */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h
index e88549cee19f..9784fed21e49 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h
@@ -18,6 +18,7 @@ struct brcmf_pub;
 struct brcmf_if;
 struct net_device;
 struct sk_buff;
+struct brcmf_event_msg;
 
 enum brcmf_awdl_op {
 	BRCMF_AWDL_OP_NONE,
@@ -98,6 +99,8 @@ int brcmf_awdl_add(struct brcmf_pub *drvr, const u8 *mac,
 		   struct net_device **ndev);
 int brcmf_awdl_del(struct brcmf_pub *drvr);
 void brcmf_awdl_suspend(struct brcmf_pub *drvr);
+int brcmf_awdl_fweh_event(struct brcmf_if *ifp,
+			  const struct brcmf_event_msg *e, void *data);
 bool brcmf_awdl_if_added(struct brcmf_pub *drvr, struct brcmf_if *ifp);
 bool brcmf_awdl_if_removed(struct brcmf_pub *drvr, struct brcmf_if *ifp);
 int brcmf_awdl_encap(struct brcmf_if *ifp, struct sk_buff *skb);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c
index 297590cebbdf..6cfe2cf1e22c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c
@@ -326,11 +326,13 @@ static void brcmf_fweh_event_worker(struct work_struct *work)
 			ifp = drvr->iflist[0];
 		else
 			ifp = drvr->iflist[emsg.bsscfgidx];
-		/* The AWDL interface has no vif, its events are not for
-		 * the cfg80211 handlers
+		/* The AWDL interface has no vif, its events go to user
+		 * space and not to the cfg80211 handlers
 		 */
-		if (ifp && ifp->awdl)
+		if (ifp && ifp->awdl) {
+			brcmf_awdl_fweh_event(ifp, &emsg, event->data);
 			goto event_free;
+		}
 
 		err = brcmf_fweh_call_event_handler(drvr, ifp, event->code,
 						    &emsg, event->data);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
index 53c4b58e6323..2faa4215e9ab 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
@@ -98,7 +98,12 @@ struct brcmf_cfg80211_info;
 	BRCMF_ABSTRACT_ENUM_DEF(EXT_AUTH_REQ, 0) \
 	BRCMF_ABSTRACT_ENUM_DEF(EXT_AUTH_FRAME_RX, 1) \
 	BRCMF_ABSTRACT_ENUM_DEF(MGMT_FRAME_TXSTATUS, 2) \
-	BRCMF_ABSTRACT_ENUM_DEF(MGMT_FRAME_OFFCHAN_DONE, 3)
+	BRCMF_ABSTRACT_ENUM_DEF(MGMT_FRAME_OFFCHAN_DONE, 3) \
+	BRCMF_ABSTRACT_ENUM_DEF(AWDL_AW, 4) \
+	BRCMF_ABSTRACT_ENUM_DEF(AWDL_ROLE, 5) \
+	BRCMF_ABSTRACT_ENUM_DEF(AWDL_EVENT, 6) \
+	BRCMF_ABSTRACT_ENUM_DEF(AWDL_STATS, 7) \
+	BRCMF_ABSTRACT_ENUM_DEF(SDB_STATE, 8)
 
 #define BRCMF_ENUM_DEF(id, val) \
 	BRCMF_E_##id = (val),
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/vendor.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/vendor.c
index 34215aa4fe70..c4a8b68e520d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/vendor.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/vendor.c
@@ -197,4 +197,12 @@ const struct nl80211_vendor_cmd_info brcmf_vendor_events[] = {
 		.vendor_id = BROADCOM_OUI,
 		.subcmd = BRCMF_VNDR_EVTS_AWDL_STOPPED
 	},
+	[BRCMF_VNDR_EVTS_AWDL_FRAME] = {
+		.vendor_id = BROADCOM_OUI,
+		.subcmd = BRCMF_VNDR_EVTS_AWDL_FRAME
+	},
+	[BRCMF_VNDR_EVTS_AWDL_ROLE] = {
+		.vendor_id = BROADCOM_OUI,
+		.subcmd = BRCMF_VNDR_EVTS_AWDL_ROLE
+	},
 };
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/vendor.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/vendor.h
index 4b372e0c7fe5..989232fc64e2 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/vendor.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/vendor.h
@@ -62,6 +62,11 @@ enum brcmf_vndr_cmds {
  *	system sleep the status is 0 or the error of the removal. When the
  *	firmware removed the interface on its own it is -%ENOLINK, sent once
  *	the interface is gone on the host.
+ * @BRCMF_VNDR_EVTS_AWDL_FRAME: AWDL action frame received from
+ *	%BRCMF_AWDL_ATTR_ADDR, the frame body from the category on in
+ *	%BRCMF_AWDL_ATTR_FRAME.
+ * @BRCMF_VNDR_EVTS_AWDL_ROLE: the firmware changed its AWDL role to
+ *	%BRCMF_AWDL_ATTR_ROLE.
  * @BRCMF_VNDR_EVTS_LAST: number of vendor events.
  *
  * The value of an event is its index in the vendor events and its vendor
@@ -71,6 +76,8 @@ enum brcmf_vndr_evts {
 	BRCMF_VNDR_EVTS_UNSPEC,
 	BRCMF_VNDR_EVTS_AWDL_STARTED,
 	BRCMF_VNDR_EVTS_AWDL_STOPPED,
+	BRCMF_VNDR_EVTS_AWDL_FRAME,
+	BRCMF_VNDR_EVTS_AWDL_ROLE,
 	BRCMF_VNDR_EVTS_LAST
 };
 
@@ -90,6 +97,9 @@ enum brcmf_vndr_evts {
  * @BRCMF_AWDL_ATTR_IFINDEX: interface index of the AWDL interface (u32).
  * @BRCMF_AWDL_ATTR_PEER_IES: HT and VHT capabilities elements of a peer,
  *	built from the AWDL TLVs it sends, as macOS passes them.
+ * @BRCMF_AWDL_ATTR_FRAME: received action frame body.
+ * @BRCMF_AWDL_ATTR_ROLE: AWDL role of the firmware (u32), 0 slave, 1 master
+ *	not taking part in the election, 2 master.
  * @__BRCMF_AWDL_ATTR_AFTER_LAST: internal use.
  * @BRCMF_AWDL_ATTR_MAX: highest attribute.
  */
@@ -105,6 +115,8 @@ enum brcmf_awdl_attrs {
 	BRCMF_AWDL_ATTR_STATUS,
 	BRCMF_AWDL_ATTR_IFINDEX,
 	BRCMF_AWDL_ATTR_PEER_IES,
+	BRCMF_AWDL_ATTR_FRAME,
+	BRCMF_AWDL_ATTR_ROLE,
 
 	__BRCMF_AWDL_ATTR_AFTER_LAST,
 	BRCMF_AWDL_ATTR_MAX = __BRCMF_AWDL_ATTR_AFTER_LAST - 1
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/core.c
index e14b5530f720..0a14f318f14a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/core.c
@@ -8,11 +8,30 @@
 #include <bus.h>
 #include <fwvid.h>
 #include <cfg80211.h>
+#include <feature.h>
+#include <fweh.h>
 
 #include "vops.h"
 
+/* Firmware events of the Apple firmware for its AWDL interface */
+#define BRCMF_WCC_E_AWDL_AW		96
+#define BRCMF_WCC_E_AWDL_ROLE		97
+#define BRCMF_WCC_E_AWDL_EVENT		98
+#define BRCMF_WCC_E_AWDL_STATS		150
+#define BRCMF_WCC_E_SDB_STATE		152
 #define BRCMF_WCC_E_LAST		213
 
+static const struct brcmf_fweh_event_map brcmf_wcc_event_map = {
+	.items = {
+		{ BRCMF_E_AWDL_AW, BRCMF_WCC_E_AWDL_AW },
+		{ BRCMF_E_AWDL_ROLE, BRCMF_WCC_E_AWDL_ROLE },
+		{ BRCMF_E_AWDL_EVENT, BRCMF_WCC_E_AWDL_EVENT },
+		{ BRCMF_E_AWDL_STATS, BRCMF_WCC_E_AWDL_STATS },
+		{ BRCMF_E_SDB_STATE, BRCMF_WCC_E_SDB_STATE },
+	},
+	.n_items = 5
+};
+
 static int brcmf_wcc_set_sae_pwd(struct brcmf_if *ifp,
 				 struct cfg80211_crypto_settings *crypto)
 {
@@ -29,11 +48,31 @@ static int brcmf_wcc_alloc_fweh_info(struct brcmf_pub *drvr)
 		return -ENOMEM;
 
 	fweh->num_event_codes = BRCMF_WCC_E_LAST;
+	fweh->event_map = &brcmf_wcc_event_map;
 	drvr->fweh = fweh;
 	return 0;
 }
 
+/*
+ * The AWDL interface reports these events, they go to user space. The
+ * firmware runs AWDL with all of them enabled in the event mask.
+ */
+static void brcmf_wcc_register_event_handlers(struct brcmf_pub *drvr)
+{
+	static const enum brcmf_fweh_event_code events[] = {
+		BRCMF_E_AWDL_AW, BRCMF_E_AWDL_ROLE, BRCMF_E_AWDL_EVENT,
+		BRCMF_E_AWDL_STATS, BRCMF_E_SDB_STATE,
+	};
+	int i;
+
+	if (!(drvr->feat_flags & BIT(BRCMF_FEAT_AWDL)))
+		return;
+	for (i = 0; i < ARRAY_SIZE(events); i++)
+		brcmf_fweh_register(drvr, events[i], brcmf_awdl_fweh_event);
+}
+
 const struct brcmf_fwvid_ops brcmf_wcc_ops = {
 	.set_sae_password = brcmf_wcc_set_sae_pwd,
 	.alloc_fweh_info = brcmf_wcc_alloc_fweh_info,
+	.register_event_handlers = brcmf_wcc_register_event_handlers,
 };
-- 
2.56.0

